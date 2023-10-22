use std::{borrow::Cow, collections::LinkedList, ops::Range, sync::MutexGuard};

use bytes::Bytes;
use wasmer::{FunctionEnvMut, WasmPtr};
use wasmer_types::MemorySize;
use wasmer_wasix_types::{types::__wasi_ciovec_t, wasi::Errno};

use crate::{
    mem_error_to_wasi, os::task::process::WasiProcessInner, syscalls::__asyncify_light,
    utils::map_snapshot_err, WasiEnv, WasiError, WasiThreadId,
};

use super::*;

#[derive(Debug, Clone)]
pub struct SnapshotEffector {}

impl SnapshotEffector {
    pub fn write_terminal_data<M: MemorySize>(
        ctx: &mut FunctionEnvMut<'_, WasiEnv>,
        iovs: WasmPtr<__wasi_ciovec_t<M>, M>,
        iovs_len: M::Offset,
    ) -> Result<Result<(), Errno>, WasiError> {
        let env = ctx.data();
        let memory = unsafe { env.memory_view(&ctx) };
        let iovs_arr = wasi_try_mem_ok_ok!(iovs.slice(&memory, iovs_len));

        wasi_try_ok_ok!(__asyncify_light(env, None, async {
            let iovs_arr = iovs_arr.access().map_err(mem_error_to_wasi)?;
            for iovs in iovs_arr.iter() {
                let buf = WasmPtr::<u8, M>::new(iovs.buf)
                    .slice(&memory, iovs.buf_len)
                    .map_err(mem_error_to_wasi)?
                    .access()
                    .map_err(mem_error_to_wasi)?;
                ctx.data()
                    .runtime()
                    .snap_shooter()
                    .write(SnapshotLog::TerminalData {
                        data: Cow::Borrowed(buf.as_ref()),
                    })
                    .await
                    .map_err(map_snapshot_err)?;
            }
            Ok(())
        })?);
        Ok(Ok(()))
    }

    pub fn write_thread_state(
        ctx: &mut FunctionEnvMut<'_, WasiEnv>,
        id: WasiThreadId,
        memory_stack: Bytes,
        rewind_stack: Bytes,
    ) -> Result<Result<(), Errno>, WasiError> {
        let env = ctx.data();
        wasi_try_ok_ok!(__asyncify_light(env, None, async {
            ctx.data()
                .runtime()
                .snap_shooter()
                .write(SnapshotLog::SetThread {
                    id,
                    call_stack: Cow::Owned(rewind_stack.into()),
                    memory_stack: Cow::Owned(memory_stack.into()),
                })
                .await
                .map_err(map_snapshot_err)?;
            Ok(())
        })?);
        Ok(Ok(()))
    }

    pub fn write_memory_and_snapshot(
        ctx: &mut FunctionEnvMut<'_, WasiEnv>,
        process: &mut MutexGuard<'_, WasiProcessInner>,
    ) -> Result<Result<(), Errno>, WasiError> {
        let env = ctx.data();
        let memory = unsafe { env.memory_view(ctx) };

        // Compute all the regions that we need to save which is basically
        // everything in the memory except for the memory stacks.
        //
        // We do not want the regions to be greater than 128KB as this will
        // otherwise create too much inefficiency.
        let mut cur = 0u64;
        let mut regions = LinkedList::<Range<u64>>::new();
        while cur < memory.data_size() {
            let mut again = false;
            let mut end = memory.data_size().min(cur + 131_072);
            for (_, thread) in process.threads.iter() {
                let layout = thread.memory_layout();
                if cur >= layout.stack_lower && cur < layout.stack_upper {
                    cur = layout.stack_upper;
                    again = true;
                    break;
                }
                if end > layout.stack_lower {
                    end = end.min(layout.stack_lower);
                }
            }
            if again {
                continue;
            }
            regions.push_back(cur..end);
            cur = end;
        }

        // Now that we known all the regions that need to be saved we
        // enter a processing loop that dumps all the data to the log
        // file in an orderly manner.
        wasi_try_ok_ok!(__asyncify_light(env, None, async {
            let memory = unsafe { env.memory_view(ctx) };
            let shooter = ctx.data().runtime().snap_shooter();

            for region in regions {
                // We grab this region of memory as a vector and hash
                // it, which allows us to make some logging efficiency
                // gains.
                let data = memory
                    .copy_range_to_vec(region.clone())
                    .map_err(mem_error_to_wasi)?;

                // Now we write it to the snap shooter
                shooter
                    .write(SnapshotLog::UpdateMemoryRegion {
                        region,
                        data: data.into(),
                    })
                    .await
                    .map_err(map_snapshot_err)?;
            }

            // Finally we mark the end of the snapshot so that
            // it can act as a restoration point
            shooter
                .write(SnapshotLog::Snapshot)
                .await
                .map_err(map_snapshot_err)?;
            Ok(())
        })?);
        Ok(Ok(()))
    }
}
