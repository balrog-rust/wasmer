;; Tests for store lane operations.


(module
  (memory 1)
  (global $zero (mut v128) (v128.const i32x4 0 0 0 0))
  (func (export "v128.store16_lane_0")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane 0 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store (local.get $address) (global.get $zero))    (local.get $ret))
  (func (export "v128.store16_lane_1")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane 1 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store (local.get $address) (global.get $zero))    (local.get $ret))
  (func (export "v128.store16_lane_2")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane 2 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store (local.get $address) (global.get $zero))    (local.get $ret))
  (func (export "v128.store16_lane_3")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane 3 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store (local.get $address) (global.get $zero))    (local.get $ret))
  (func (export "v128.store16_lane_4")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane 4 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store (local.get $address) (global.get $zero))    (local.get $ret))
  (func (export "v128.store16_lane_5")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane 5 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store (local.get $address) (global.get $zero))    (local.get $ret))
  (func (export "v128.store16_lane_6")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane 6 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store (local.get $address) (global.get $zero))    (local.get $ret))
  (func (export "v128.store16_lane_7")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane 7 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store (local.get $address) (global.get $zero))    (local.get $ret))
  (func (export "v128.store16_lane_0_offset_0")
    (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane offset=0 0 (i32.const 0) (local.get $x))
    (local.set $ret (i64.load offset=0 (i32.const 0)))
    (v128.store offset=0 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_1_offset_1")
    (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane offset=1 1 (i32.const 0) (local.get $x))
    (local.set $ret (i64.load offset=1 (i32.const 0)))
    (v128.store offset=1 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_2_offset_2")
    (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane offset=2 2 (i32.const 0) (local.get $x))
    (local.set $ret (i64.load offset=2 (i32.const 0)))
    (v128.store offset=2 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_3_offset_3")
    (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane offset=3 3 (i32.const 0) (local.get $x))
    (local.set $ret (i64.load offset=3 (i32.const 0)))
    (v128.store offset=3 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_4_offset_4")
    (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane offset=4 4 (i32.const 0) (local.get $x))
    (local.set $ret (i64.load offset=4 (i32.const 0)))
    (v128.store offset=4 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_5_offset_5")
    (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane offset=5 5 (i32.const 0) (local.get $x))
    (local.set $ret (i64.load offset=5 (i32.const 0)))
    (v128.store offset=5 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_6_offset_6")
    (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane offset=6 6 (i32.const 0) (local.get $x))
    (local.set $ret (i64.load offset=6 (i32.const 0)))
    (v128.store offset=6 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_7_offset_7")
    (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane offset=7 7 (i32.const 0) (local.get $x))
    (local.set $ret (i64.load offset=7 (i32.const 0)))
    (v128.store offset=7 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_0_align_1")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=1 0 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=0 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_0_align_2")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=2 0 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=0 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_1_align_1")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=1 1 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=1 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_1_align_2")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=2 1 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=1 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_2_align_1")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=1 2 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=2 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_2_align_2")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=2 2 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=2 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_3_align_1")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=1 3 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=3 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_3_align_2")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=2 3 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=3 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_4_align_1")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=1 4 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=4 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_4_align_2")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=2 4 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=4 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_5_align_1")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=1 5 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=5 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_5_align_2")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=2 5 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=5 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_6_align_1")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=1 6 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=6 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_6_align_2")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=2 6 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=6 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_7_align_1")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=1 7 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=7 (i32.const 0) (global.get $zero))
    (local.get $ret))
  (func (export "v128.store16_lane_7_align_2")
    (param $address i32) (param $x v128) (result i64) (local $ret i64)
    (v128.store16_lane align=2 7 (local.get $address) (local.get $x))
    (local.set $ret (i64.load (local.get $address)))
    (v128.store offset=7 (i32.const 0) (global.get $zero))
    (local.get $ret))
)

(assert_return (invoke "v128.store16_lane_0" (i32.const 0)
                                             (v128.const i16x8 256 0 0 0 0 0 0 0))
                                             (i64.const 256))
(assert_return (invoke "v128.store16_lane_1" (i32.const 1)
                                             (v128.const i16x8 0 513 0 0 0 0 0 0))
                                             (i64.const 513))
(assert_return (invoke "v128.store16_lane_2" (i32.const 2)
                                             (v128.const i16x8 0 0 770 0 0 0 0 0))
                                             (i64.const 770))
(assert_return (invoke "v128.store16_lane_3" (i32.const 3)
                                             (v128.const i16x8 0 0 0 1027 0 0 0 0))
                                             (i64.const 1027))
(assert_return (invoke "v128.store16_lane_4" (i32.const 4)
                                             (v128.const i16x8 0 0 0 0 1284 0 0 0))
                                             (i64.const 1284))
(assert_return (invoke "v128.store16_lane_5" (i32.const 5)
                                             (v128.const i16x8 0 0 0 0 0 1541 0 0))
                                             (i64.const 1541))
(assert_return (invoke "v128.store16_lane_6" (i32.const 6)
                                             (v128.const i16x8 0 0 0 0 0 0 1798 0))
                                             (i64.const 1798))
(assert_return (invoke "v128.store16_lane_7" (i32.const 7)
                                             (v128.const i16x8 0 0 0 0 0 0 0 2055))
                                             (i64.const 2055))
(assert_return (invoke "v128.store16_lane_0_offset_0" (v128.const i16x8 256 0 0 0 0 0 0 0))
                                                      (i64.const 256))
(assert_return (invoke "v128.store16_lane_1_offset_1" (v128.const i16x8 0 513 0 0 0 0 0 0))
                                                      (i64.const 513))
(assert_return (invoke "v128.store16_lane_2_offset_2" (v128.const i16x8 0 0 770 0 0 0 0 0))
                                                      (i64.const 770))
(assert_return (invoke "v128.store16_lane_3_offset_3" (v128.const i16x8 0 0 0 1027 0 0 0 0))
                                                      (i64.const 1027))
(assert_return (invoke "v128.store16_lane_4_offset_4" (v128.const i16x8 0 0 0 0 1284 0 0 0))
                                                      (i64.const 1284))
(assert_return (invoke "v128.store16_lane_5_offset_5" (v128.const i16x8 0 0 0 0 0 1541 0 0))
                                                      (i64.const 1541))
(assert_return (invoke "v128.store16_lane_6_offset_6" (v128.const i16x8 0 0 0 0 0 0 1798 0))
                                                      (i64.const 1798))
(assert_return (invoke "v128.store16_lane_7_offset_7" (v128.const i16x8 0 0 0 0 0 0 0 2055))
                                                      (i64.const 2055))
(assert_return (invoke "v128.store16_lane_0_align_1" (i32.const 0)
                                                     (v128.const i16x8 256 0 0 0 0 0 0 0))
                                                     (i64.const 256))
(assert_return (invoke "v128.store16_lane_0_align_2" (i32.const 0)
                                                     (v128.const i16x8 256 0 0 0 0 0 0 0))
                                                     (i64.const 256))
(assert_return (invoke "v128.store16_lane_1_align_1" (i32.const 1)
                                                     (v128.const i16x8 0 513 0 0 0 0 0 0))
                                                     (i64.const 513))
(assert_return (invoke "v128.store16_lane_1_align_2" (i32.const 1)
                                                     (v128.const i16x8 0 513 0 0 0 0 0 0))
                                                     (i64.const 513))
(assert_return (invoke "v128.store16_lane_2_align_1" (i32.const 2)
                                                     (v128.const i16x8 0 0 770 0 0 0 0 0))
                                                     (i64.const 770))
(assert_return (invoke "v128.store16_lane_2_align_2" (i32.const 2)
                                                     (v128.const i16x8 0 0 770 0 0 0 0 0))
                                                     (i64.const 770))
(assert_return (invoke "v128.store16_lane_3_align_1" (i32.const 3)
                                                     (v128.const i16x8 0 0 0 1027 0 0 0 0))
                                                     (i64.const 1027))
(assert_return (invoke "v128.store16_lane_3_align_2" (i32.const 3)
                                                     (v128.const i16x8 0 0 0 1027 0 0 0 0))
                                                     (i64.const 1027))
(assert_return (invoke "v128.store16_lane_4_align_1" (i32.const 4)
                                                     (v128.const i16x8 0 0 0 0 1284 0 0 0))
                                                     (i64.const 1284))
(assert_return (invoke "v128.store16_lane_4_align_2" (i32.const 4)
                                                     (v128.const i16x8 0 0 0 0 1284 0 0 0))
                                                     (i64.const 1284))
(assert_return (invoke "v128.store16_lane_5_align_1" (i32.const 5)
                                                     (v128.const i16x8 0 0 0 0 0 1541 0 0))
                                                     (i64.const 1541))
(assert_return (invoke "v128.store16_lane_5_align_2" (i32.const 5)
                                                     (v128.const i16x8 0 0 0 0 0 1541 0 0))
                                                     (i64.const 1541))
(assert_return (invoke "v128.store16_lane_6_align_1" (i32.const 6)
                                                     (v128.const i16x8 0 0 0 0 0 0 1798 0))
                                                     (i64.const 1798))
(assert_return (invoke "v128.store16_lane_6_align_2" (i32.const 6)
                                                     (v128.const i16x8 0 0 0 0 0 0 1798 0))
                                                     (i64.const 1798))
(assert_return (invoke "v128.store16_lane_7_align_1" (i32.const 7)
                                                     (v128.const i16x8 0 0 0 0 0 0 0 2055))
                                                     (i64.const 2055))
(assert_return (invoke "v128.store16_lane_7_align_2" (i32.const 7)
                                                     (v128.const i16x8 0 0 0 0 0 0 0 2055))
                                                     (i64.const 2055))

;; type check
(assert_invalid  (module (memory 1)
          (func (param $x v128) (result v128)
            (v128.store16_lane 0 (local.get $x) (i32.const 0))))
  "type mismatch")

;; invalid lane index
(assert_invalid  (module (memory 1)
          (func (param $x v128) (result v128)
            (v128.store16_lane 8 (i32.const 0) (local.get $x))))
  "invalid lane index")

;; invalid memarg alignment
(assert_invalid
  (module (memory 1)
          (func (param $x v128) (result v128)
          (v128.store16_lane align=4 0 (i32.const 0) (local.get $x))))
  "alignment must not be larger than natural")