; ModuleID = 'autocfg_f9731b0197401245_1.541556d6509e1bf1-cgu.0'
source_filename = "autocfg_f9731b0197401245_1.541556d6509e1bf1-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"core::fmt::rt::Argument<'_>" = type { %"core::fmt::rt::ArgumentType<'_>" }
%"core::fmt::rt::ArgumentType<'_>" = type { [1 x i64], ptr }

@alloc_8df0580a595a87d56789d20c7318e185 = private unnamed_addr constant <{ [166 x i8] }> <{ [166 x i8] c"unsafe precondition(s) violated: ptr::copy_nonoverlapping requires that both pointer arguments are aligned and non-null and the specified memory ranges do not overlap" }>, align 1
@alloc_fad0cd83b7d1858a846a172eb260e593 = private unnamed_addr constant <{ [42 x i8] }> <{ [42 x i8] c"is_aligned_to: align is not a power-of-two" }>, align 1
@alloc_041983ee8170efdaaf95ba67fd072d26 = private unnamed_addr constant <{ ptr, [8 x i8] }> <{ ptr @alloc_fad0cd83b7d1858a846a172eb260e593, [8 x i8] c"*\00\00\00\00\00\00\00" }>, align 8
@0 = private unnamed_addr constant <{ [8 x i8], [8 x i8] }> <{ [8 x i8] zeroinitializer, [8 x i8] undef }>, align 8
@alloc_69f15bff8059880065ca4860a48f578a = private unnamed_addr constant <{ [81 x i8] }> <{ [81 x i8] c"/rustc/f6e511eec7342f59a25f7c0534f1dbea00d01b14/library/core/src/ptr/const_ptr.rs" }>, align 1
@alloc_bc25f4d4ce45194c62f9b054c79e1cf8 = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_69f15bff8059880065ca4860a48f578a, [16 x i8] c"Q\00\00\00\00\00\00\00\EB\05\00\00\0D\00\00\00" }>, align 8
@alloc_ffc44ed1670ebf78d81555edceff65f6 = private unnamed_addr constant <{ [69 x i8] }> <{ [69 x i8] c"unsafe precondition(s) violated: usize::unchecked_mul cannot overflow" }>, align 1
@alloc_d4d2a2a8539eafc62756407d946babb3 = private unnamed_addr constant <{ [110 x i8] }> <{ [110 x i8] c"unsafe precondition(s) violated: ptr::read_volatile requires that the pointer argument is aligned and non-null" }>, align 1
@alloc_20b3d155afd5c58c42e598b7e6d186ef = private unnamed_addr constant <{ [93 x i8] }> <{ [93 x i8] c"unsafe precondition(s) violated: NonNull::new_unchecked requires that the pointer is non-null" }>, align 1
@alloc_ab14703751a9eb3585c49b2e55e9a9e5 = private unnamed_addr constant <{ [104 x i8] }> <{ [104 x i8] c"unsafe precondition(s) violated: hint::assert_unchecked must never be called when the condition is false" }>, align 1
@alloc_cd1513ae8d1ae22acf9342b8dfa1561d = private unnamed_addr constant <{ [164 x i8] }> <{ [164 x i8] c"unsafe precondition(s) violated: Layout::from_size_align_unchecked requires that align is a power of 2 and the rounded-up allocation size does not exceed isize::MAX" }>, align 1
@1 = private unnamed_addr constant <{ [8 x i8], [8 x i8] }> <{ [8 x i8] c"\01\00\00\00\00\00\00\00", [8 x i8] undef }>, align 8
@alloc_763310d78c99c2c1ad3f8a9821e942f3 = private unnamed_addr constant <{ [61 x i8] }> <{ [61 x i8] c"is_nonoverlapping: `size_of::<T>() * count` overflows a usize" }>, align 1
@__rust_no_alloc_shim_is_unstable = external global i8
@alloc_b99730e73100e73a81f4fbfe74b3821d = private unnamed_addr constant <{ ptr, [8 x i8] }> <{ ptr inttoptr (i64 1 to ptr), [8 x i8] zeroinitializer }>, align 8
@alloc_53973d2fe29b4adba8bb7390b5678745 = private unnamed_addr constant <{ [8 x i8] }> zeroinitializer, align 8

; core::intrinsics::copy_nonoverlapping::precondition_check
; Function Attrs: inlinehint nounwind nonlazybind uwtable
define internal void @_ZN4core10intrinsics19copy_nonoverlapping18precondition_check17h5135f769150d7fa4E(ptr %src, ptr %dst, i64 %size, i64 %align, i64 %count) unnamed_addr #0 personality ptr @rust_eh_personality {
start:
  %0 = alloca [4 x i8], align 4
  %1 = alloca [4 x i8], align 4
  %_23 = alloca [48 x i8], align 8
  %_14 = alloca [48 x i8], align 8
  %_12 = ptrtoint ptr %src to i64
  %2 = icmp eq i64 %_12, 0
  br i1 %2, label %bb8, label %bb9

bb8:                                              ; preds = %start
  br label %bb6

bb9:                                              ; preds = %start
  %3 = call i64 @llvm.ctpop.i64(i64 %align)
  %4 = trunc i64 %3 to i32
  store i32 %4, ptr %1, align 4
  %_15 = load i32, ptr %1, align 4
  %5 = icmp eq i32 %_15, 1
  br i1 %5, label %bb10, label %bb11

bb6:                                              ; preds = %bb10, %bb8
  br label %bb7

bb10:                                             ; preds = %bb9
  %_19 = sub i64 %align, 1
  %_18 = and i64 %_12, %_19
  %_6 = icmp eq i64 %_18, 0
  br i1 %_6, label %bb1, label %bb6

bb11:                                             ; preds = %bb9
  store ptr @alloc_041983ee8170efdaaf95ba67fd072d26, ptr %_14, align 8
  %6 = getelementptr inbounds i8, ptr %_14, i64 8
  store i64 1, ptr %6, align 8
  %7 = load ptr, ptr @0, align 8
  %8 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  %9 = getelementptr inbounds i8, ptr %_14, i64 32
  store ptr %7, ptr %9, align 8
  %10 = getelementptr inbounds i8, ptr %9, i64 8
  store i64 %8, ptr %10, align 8
  %11 = getelementptr inbounds i8, ptr %_14, i64 16
  store ptr inttoptr (i64 8 to ptr), ptr %11, align 8
  %12 = getelementptr inbounds i8, ptr %11, i64 8
  store i64 0, ptr %12, align 8
; invoke core::panicking::panic_fmt
  invoke void @_ZN4core9panicking9panic_fmt17h3eea515d05f7a35eE(ptr align 8 %_14, ptr align 8 @alloc_bc25f4d4ce45194c62f9b054c79e1cf8) #13
          to label %unreachable unwind label %terminate

bb1:                                              ; preds = %bb10
  %_21 = ptrtoint ptr %dst to i64
  %13 = icmp eq i64 %_21, 0
  br i1 %13, label %bb13, label %bb14

bb7:                                              ; preds = %bb4, %bb5, %bb6
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h9f485ff9b02bac75E(ptr align 1 @alloc_8df0580a595a87d56789d20c7318e185, i64 166) #14
  unreachable

bb13:                                             ; preds = %bb1
  br label %bb5

bb14:                                             ; preds = %bb1
  %14 = call i64 @llvm.ctpop.i64(i64 %align)
  %15 = trunc i64 %14 to i32
  store i32 %15, ptr %0, align 4
  %_24 = load i32, ptr %0, align 4
  %16 = icmp eq i32 %_24, 1
  br i1 %16, label %bb15, label %bb16

bb5:                                              ; preds = %bb15, %bb13
  br label %bb7

bb15:                                             ; preds = %bb14
  %_28 = sub i64 %align, 1
  %_27 = and i64 %_21, %_28
  %_7 = icmp eq i64 %_27, 0
  br i1 %_7, label %bb2, label %bb5

bb16:                                             ; preds = %bb14
  store ptr @alloc_041983ee8170efdaaf95ba67fd072d26, ptr %_23, align 8
  %17 = getelementptr inbounds i8, ptr %_23, i64 8
  store i64 1, ptr %17, align 8
  %18 = load ptr, ptr @0, align 8
  %19 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  %20 = getelementptr inbounds i8, ptr %_23, i64 32
  store ptr %18, ptr %20, align 8
  %21 = getelementptr inbounds i8, ptr %20, i64 8
  store i64 %19, ptr %21, align 8
  %22 = getelementptr inbounds i8, ptr %_23, i64 16
  store ptr inttoptr (i64 8 to ptr), ptr %22, align 8
  %23 = getelementptr inbounds i8, ptr %22, i64 8
  store i64 0, ptr %23, align 8
; invoke core::panicking::panic_fmt
  invoke void @_ZN4core9panicking9panic_fmt17h3eea515d05f7a35eE(ptr align 8 %_23, ptr align 8 @alloc_bc25f4d4ce45194c62f9b054c79e1cf8) #13
          to label %unreachable unwind label %terminate

bb2:                                              ; preds = %bb15
; invoke core::ub_checks::is_nonoverlapping::runtime
  %_9 = invoke zeroext i1 @_ZN4core9ub_checks17is_nonoverlapping7runtime17he583fd8555f762a0E(ptr %src, ptr %dst, i64 %size, i64 %count)
          to label %bb18 unwind label %terminate

terminate:                                        ; preds = %bb11, %bb16, %bb2
  %24 = landingpad { ptr, i32 }
          filter [0 x ptr] zeroinitializer
  %25 = extractvalue { ptr, i32 } %24, 0
  %26 = extractvalue { ptr, i32 } %24, 1
; call core::panicking::panic_cannot_unwind
  call void @_ZN4core9panicking19panic_cannot_unwind17hea865182d7ce50afE() #15
  unreachable

bb18:                                             ; preds = %bb2
  br i1 %_9, label %bb3, label %bb4

bb4:                                              ; preds = %bb18
  br label %bb7

bb3:                                              ; preds = %bb18
  ret void

unreachable:                                      ; preds = %bb11, %bb16
  unreachable
}

; core::intrinsics::unlikely
; Function Attrs: nounwind nonlazybind uwtable
define internal zeroext i1 @_ZN4core10intrinsics8unlikely17hc876eafc8a2ebb37E(i1 zeroext %b) unnamed_addr #1 {
start:
  ret i1 %b
}

; core::fmt::Arguments::new_v1
; Function Attrs: inlinehint nonlazybind uwtable
define void @_ZN4core3fmt9Arguments6new_v117h5368b5b1c007a8e2E(ptr sret([48 x i8]) align 8 %_0, ptr align 8 %pieces, ptr align 8 %args) unnamed_addr #2 {
start:
  store ptr %pieces, ptr %_0, align 8
  %0 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 1, ptr %0, align 8
  %1 = load ptr, ptr @0, align 8
  %2 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  %3 = getelementptr inbounds i8, ptr %_0, i64 32
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 8
  store i64 %2, ptr %4, align 8
  %5 = getelementptr inbounds i8, ptr %_0, i64 16
  store ptr %args, ptr %5, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 8
  store i64 1, ptr %6, align 8
  ret void
}

; core::num::<impl usize>::unchecked_mul::precondition_check
; Function Attrs: inlinehint nounwind nonlazybind uwtable
define internal void @"_ZN4core3num23_$LT$impl$u20$usize$GT$13unchecked_mul18precondition_check17hda9a48884c47fa2fE"(i64 %lhs, i64 %rhs) unnamed_addr #0 {
start:
  %0 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %lhs, i64 %rhs)
  %_6.0 = extractvalue { i64, i1 } %0, 0
  %_6.1 = extractvalue { i64, i1 } %0, 1
  br i1 %_6.1, label %bb1, label %bb2

bb2:                                              ; preds = %start
  ret void

bb1:                                              ; preds = %start
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h9f485ff9b02bac75E(ptr align 1 @alloc_ffc44ed1670ebf78d81555edceff65f6, i64 69) #14
  unreachable
}

; core::ops::function::FnOnce::call_once
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @_ZN4core3ops8function6FnOnce9call_once17hcef299a31c29d4c7E(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %0, i64 %1) unnamed_addr #2 {
start:
  %_2 = alloca [16 x i8], align 8
  store ptr %0, ptr %_2, align 8
  %2 = getelementptr inbounds i8, ptr %_2, i64 8
  store i64 %1, ptr %2, align 8
  %3 = load ptr, ptr %_2, align 8
  %4 = getelementptr inbounds i8, ptr %_2, i64 8
  %5 = load i64, ptr %4, align 8
; call alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
  call void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17ha022a01d6f63f505E"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %3, i64 %5)
  ret void
}

; core::ptr::read_volatile::precondition_check
; Function Attrs: inlinehint nounwind nonlazybind uwtable
define internal void @_ZN4core3ptr13read_volatile18precondition_check17h5d86a02be90fec5cE(ptr %addr, i64 %align) unnamed_addr #0 personality ptr @rust_eh_personality {
start:
  %0 = alloca [4 x i8], align 4
  %_8 = alloca [48 x i8], align 8
  %_6 = ptrtoint ptr %addr to i64
  %1 = icmp eq i64 %_6, 0
  br i1 %1, label %bb3, label %bb4

bb3:                                              ; preds = %start
  br label %bb2

bb4:                                              ; preds = %start
  %2 = call i64 @llvm.ctpop.i64(i64 %align)
  %3 = trunc i64 %2 to i32
  store i32 %3, ptr %0, align 4
  %_9 = load i32, ptr %0, align 4
  %4 = icmp eq i32 %_9, 1
  br i1 %4, label %bb5, label %bb6

bb2:                                              ; preds = %bb5, %bb3
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h9f485ff9b02bac75E(ptr align 1 @alloc_d4d2a2a8539eafc62756407d946babb3, i64 110) #14
  unreachable

bb5:                                              ; preds = %bb4
  %_13 = sub i64 %align, 1
  %_12 = and i64 %_6, %_13
  %_3 = icmp eq i64 %_12, 0
  br i1 %_3, label %bb1, label %bb2

bb6:                                              ; preds = %bb4
  store ptr @alloc_041983ee8170efdaaf95ba67fd072d26, ptr %_8, align 8
  %5 = getelementptr inbounds i8, ptr %_8, i64 8
  store i64 1, ptr %5, align 8
  %6 = load ptr, ptr @0, align 8
  %7 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  %8 = getelementptr inbounds i8, ptr %_8, i64 32
  store ptr %6, ptr %8, align 8
  %9 = getelementptr inbounds i8, ptr %8, i64 8
  store i64 %7, ptr %9, align 8
  %10 = getelementptr inbounds i8, ptr %_8, i64 16
  store ptr inttoptr (i64 8 to ptr), ptr %10, align 8
  %11 = getelementptr inbounds i8, ptr %10, i64 8
  store i64 0, ptr %11, align 8
; invoke core::panicking::panic_fmt
  invoke void @_ZN4core9panicking9panic_fmt17h3eea515d05f7a35eE(ptr align 8 %_8, ptr align 8 @alloc_bc25f4d4ce45194c62f9b054c79e1cf8) #13
          to label %unreachable unwind label %terminate

bb1:                                              ; preds = %bb5
  ret void

terminate:                                        ; preds = %bb6
  %12 = landingpad { ptr, i32 }
          filter [0 x ptr] zeroinitializer
  %13 = extractvalue { ptr, i32 } %12, 0
  %14 = extractvalue { ptr, i32 } %12, 1
; call core::panicking::panic_cannot_unwind
  call void @_ZN4core9panicking19panic_cannot_unwind17hea865182d7ce50afE() #15
  unreachable

unreachable:                                      ; preds = %bb6
  unreachable
}

; core::ptr::drop_in_place<alloc::string::String>
; Function Attrs: nonlazybind uwtable
define void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h253e530b660d780bE"(ptr align 8 %_1) unnamed_addr #3 {
start:
; call core::ptr::drop_in_place<alloc::vec::Vec<u8>>
  call void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h8839423f76575917E"(ptr align 8 %_1)
  ret void
}

; core::ptr::drop_in_place<alloc::vec::Vec<u8>>
; Function Attrs: nonlazybind uwtable
define void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h8839423f76575917E"(ptr align 8 %_1) unnamed_addr #3 personality ptr @rust_eh_personality {
start:
  %0 = alloca [16 x i8], align 8
; invoke <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
  invoke void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h9ac301fe34baeea9E"(ptr align 8 %_1)
          to label %bb4 unwind label %cleanup

bb3:                                              ; preds = %cleanup
; invoke core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  invoke void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17h49f67637b1dbdad6E"(ptr align 8 %_1) #16
          to label %bb1 unwind label %terminate

cleanup:                                          ; preds = %start
  %1 = landingpad { ptr, i32 }
          cleanup
  %2 = extractvalue { ptr, i32 } %1, 0
  %3 = extractvalue { ptr, i32 } %1, 1
  store ptr %2, ptr %0, align 8
  %4 = getelementptr inbounds i8, ptr %0, i64 8
  store i32 %3, ptr %4, align 8
  br label %bb3

bb4:                                              ; preds = %start
; call core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  call void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17h49f67637b1dbdad6E"(ptr align 8 %_1)
  ret void

terminate:                                        ; preds = %bb3
  %5 = landingpad { ptr, i32 }
          filter [0 x ptr] zeroinitializer
  %6 = extractvalue { ptr, i32 } %5, 0
  %7 = extractvalue { ptr, i32 } %5, 1
; call core::panicking::panic_in_cleanup
  call void @_ZN4core9panicking16panic_in_cleanup17hb6fcb0ed7ad330b7E() #15
  unreachable

bb1:                                              ; preds = %bb3
  %8 = load ptr, ptr %0, align 8
  %9 = getelementptr inbounds i8, ptr %0, i64 8
  %10 = load i32, ptr %9, align 8
  %11 = insertvalue { ptr, i32 } poison, ptr %8, 0
  %12 = insertvalue { ptr, i32 } %11, i32 %10, 1
  resume { ptr, i32 } %12
}

; core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
; Function Attrs: nonlazybind uwtable
define void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17h49f67637b1dbdad6E"(ptr align 8 %_1) unnamed_addr #3 {
start:
; call <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
  call void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hcd26217cb274d262E"(ptr align 8 %_1)
  ret void
}

; core::ptr::non_null::NonNull<T>::new_unchecked::precondition_check
; Function Attrs: inlinehint nounwind nonlazybind uwtable
define internal void @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17hfbf37ed5012b753fE"(ptr %ptr) unnamed_addr #0 {
start:
  %_4 = ptrtoint ptr %ptr to i64
  %0 = icmp eq i64 %_4, 0
  br i1 %0, label %bb1, label %bb2

bb1:                                              ; preds = %start
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h9f485ff9b02bac75E(ptr align 1 @alloc_20b3d155afd5c58c42e598b7e6d186ef, i64 93) #14
  unreachable

bb2:                                              ; preds = %start
  ret void
}

; core::hint::assert_unchecked::precondition_check
; Function Attrs: inlinehint nounwind nonlazybind uwtable
define internal void @_ZN4core4hint16assert_unchecked18precondition_check17h30a1808f02ab3051E(i1 zeroext %cond) unnamed_addr #0 {
start:
  br i1 %cond, label %bb2, label %bb1

bb1:                                              ; preds = %start
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h9f485ff9b02bac75E(ptr align 1 @alloc_ab14703751a9eb3585c49b2e55e9a9e5, i64 104) #14
  unreachable

bb2:                                              ; preds = %start
  ret void
}

; core::alloc::layout::Layout::from_size_align_unchecked::precondition_check
; Function Attrs: inlinehint nounwind nonlazybind uwtable
define internal void @_ZN4core5alloc6layout6Layout25from_size_align_unchecked18precondition_check17h0b1e299b8eb6081bE(i64 %size, i64 %align) unnamed_addr #0 personality ptr @rust_eh_personality {
start:
; invoke core::alloc::layout::Layout::is_size_align_valid
  %_3 = invoke zeroext i1 @_ZN4core5alloc6layout6Layout19is_size_align_valid17h27157fff07002cf3E(i64 %size, i64 %align)
          to label %bb1 unwind label %terminate

terminate:                                        ; preds = %start
  %0 = landingpad { ptr, i32 }
          filter [0 x ptr] zeroinitializer
  %1 = extractvalue { ptr, i32 } %0, 0
  %2 = extractvalue { ptr, i32 } %0, 1
; call core::panicking::panic_cannot_unwind
  call void @_ZN4core9panicking19panic_cannot_unwind17hea865182d7ce50afE() #15
  unreachable

bb1:                                              ; preds = %start
  br i1 %_3, label %bb2, label %bb3

bb3:                                              ; preds = %bb1
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h9f485ff9b02bac75E(ptr align 1 @alloc_cd1513ae8d1ae22acf9342b8dfa1561d, i64 164) #14
  unreachable

bb2:                                              ; preds = %bb1
  ret void
}

; core::alloc::layout::Layout::repeat
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @_ZN4core5alloc6layout6Layout6repeat17h00183f082c875b5eE(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %self, i64 %n) unnamed_addr #2 {
start:
  %0 = alloca [1 x i8], align 1
  %_16 = alloca [8 x i8], align 8
  %_14 = alloca [24 x i8], align 8
  %self3 = alloca [16 x i8], align 8
  %_11 = alloca [16 x i8], align 8
  %self2 = alloca [16 x i8], align 8
  %self1 = alloca [16 x i8], align 8
  %_7 = alloca [16 x i8], align 8
  %1 = getelementptr inbounds i8, ptr %self, i64 8
  %len = load i64, ptr %1, align 8
  %self4 = load i64, ptr %self, align 8
  store i64 %self4, ptr %_16, align 8
  %_17 = load i64, ptr %_16, align 8
  %_18 = icmp uge i64 %_17, 1
  %_19 = icmp ule i64 %_17, -9223372036854775808
  %_20 = and i1 %_18, %_19
  %self5 = add i64 %len, %_17
  %_22 = sub i64 %self5, 1
  %_25 = sub i64 %_17, 1
  %_24 = xor i64 %_25, -1
  %len_rounded_up = and i64 %_22, %_24
  %_5 = sub i64 %len_rounded_up, %len
  %padded_size = add i64 %len, %_5
  %2 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %padded_size, i64 %n)
  %_29.0 = extractvalue { i64, i1 } %2, 0
  %_29.1 = extractvalue { i64, i1 } %2, 1
  %3 = call i1 @llvm.expect.i1(i1 %_29.1, i1 false)
  %4 = zext i1 %3 to i8
  store i8 %4, ptr %0, align 1
  %5 = load i8, ptr %0, align 1
  %_26 = trunc i8 %5 to i1
  br i1 %_26, label %bb4, label %bb5

bb5:                                              ; preds = %start
  %6 = getelementptr inbounds i8, ptr %self2, i64 8
  store i64 %_29.0, ptr %6, align 8
  store i64 1, ptr %self2, align 8
  %7 = getelementptr inbounds i8, ptr %self2, i64 8
  %v = load i64, ptr %7, align 8
  %8 = getelementptr inbounds i8, ptr %self1, i64 8
  store i64 %v, ptr %8, align 8
  store i64 0, ptr %self1, align 8
  %9 = getelementptr inbounds i8, ptr %self1, i64 8
  %v6 = load i64, ptr %9, align 8
  %10 = getelementptr inbounds i8, ptr %_7, i64 8
  store i64 %v6, ptr %10, align 8
  store i64 0, ptr %_7, align 8
  %11 = getelementptr inbounds i8, ptr %_7, i64 8
  %alloc_size = load i64, ptr %11, align 8
  %_36 = sub i64 9223372036854775807, %_25
  %_35 = icmp ugt i64 %alloc_size, %_36
  br i1 %_35, label %bb6, label %bb7

bb4:                                              ; preds = %start
  %12 = load i64, ptr @0, align 8
  %13 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  store i64 %12, ptr %self2, align 8
  %14 = getelementptr inbounds i8, ptr %self2, i64 8
  store i64 %13, ptr %14, align 8
  %15 = load i64, ptr @1, align 8
  %16 = load i64, ptr getelementptr inbounds (i8, ptr @1, i64 8), align 8
  store i64 %15, ptr %self1, align 8
  %17 = getelementptr inbounds i8, ptr %self1, i64 8
  store i64 %16, ptr %17, align 8
  store i64 0, ptr %_0, align 8
  br label %bb1

bb7:                                              ; preds = %bb5
  store i64 %self4, ptr %self3, align 8
  %18 = getelementptr inbounds i8, ptr %self3, i64 8
  store i64 %alloc_size, ptr %18, align 8
  %v.0 = load i64, ptr %self3, align 8
  %19 = getelementptr inbounds i8, ptr %self3, i64 8
  %v.1 = load i64, ptr %19, align 8
  store i64 %v.0, ptr %_11, align 8
  %20 = getelementptr inbounds i8, ptr %_11, i64 8
  store i64 %v.1, ptr %20, align 8
  %layout.0 = load i64, ptr %_11, align 8
  %21 = getelementptr inbounds i8, ptr %_11, i64 8
  %layout.1 = load i64, ptr %21, align 8
  store i64 %layout.0, ptr %_14, align 8
  %22 = getelementptr inbounds i8, ptr %_14, i64 8
  store i64 %layout.1, ptr %22, align 8
  %23 = getelementptr inbounds i8, ptr %_14, i64 16
  store i64 %padded_size, ptr %23, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %_14, i64 24, i1 false)
  br label %bb2

bb6:                                              ; preds = %bb5
  %24 = load i64, ptr @0, align 8
  %25 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  store i64 %24, ptr %self3, align 8
  %26 = getelementptr inbounds i8, ptr %self3, i64 8
  store i64 %25, ptr %26, align 8
  store i64 0, ptr %_0, align 8
  br label %bb1

bb2:                                              ; preds = %bb1, %bb7
  ret void

bb1:                                              ; preds = %bb4, %bb6
  br label %bb2
}

; core::option::Option<T>::map_or_else
; Function Attrs: inlinehint nonlazybind uwtable
define void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17h4072bc07b2dfcea1E"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %0, i64 %1, ptr align 8 %default) unnamed_addr #2 personality ptr @rust_eh_personality {
start:
  %2 = alloca [16 x i8], align 8
  %_10 = alloca [1 x i8], align 1
  %_9 = alloca [1 x i8], align 1
  %self = alloca [16 x i8], align 8
  store ptr %0, ptr %self, align 8
  %3 = getelementptr inbounds i8, ptr %self, i64 8
  store i64 %1, ptr %3, align 8
  store i8 1, ptr %_10, align 1
  store i8 1, ptr %_9, align 1
  %4 = load ptr, ptr %self, align 8
  %5 = ptrtoint ptr %4 to i64
  %6 = icmp eq i64 %5, 0
  %_4 = select i1 %6, i64 0, i64 1
  %7 = icmp eq i64 %_4, 0
  br i1 %7, label %bb2, label %bb3

bb2:                                              ; preds = %start
  store i8 0, ptr %_10, align 1
; invoke alloc::fmt::format::{{closure}}
  invoke void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17h6da84f85bc8f63f5E"(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %default)
          to label %bb5 unwind label %cleanup

bb3:                                              ; preds = %start
  %t.0 = load ptr, ptr %self, align 8
  %8 = getelementptr inbounds i8, ptr %self, i64 8
  %t.1 = load i64, ptr %8, align 8
  store i8 0, ptr %_9, align 1
; invoke core::ops::function::FnOnce::call_once
  invoke void @_ZN4core3ops8function6FnOnce9call_once17hcef299a31c29d4c7E(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %t.0, i64 %t.1)
          to label %bb4 unwind label %cleanup

bb11:                                             ; preds = %cleanup
  %9 = load i8, ptr %_9, align 1
  %10 = trunc i8 %9 to i1
  br i1 %10, label %bb10, label %bb7

cleanup:                                          ; preds = %bb3, %bb2
  %11 = landingpad { ptr, i32 }
          cleanup
  %12 = extractvalue { ptr, i32 } %11, 0
  %13 = extractvalue { ptr, i32 } %11, 1
  store ptr %12, ptr %2, align 8
  %14 = getelementptr inbounds i8, ptr %2, i64 8
  store i32 %13, ptr %14, align 8
  br label %bb11

bb5:                                              ; preds = %bb2
  br label %bb6

bb6:                                              ; preds = %bb9, %bb4, %bb5
  ret void

bb4:                                              ; preds = %bb3
  %15 = load i8, ptr %_10, align 1
  %16 = trunc i8 %15 to i1
  br i1 %16, label %bb9, label %bb6

bb9:                                              ; preds = %bb4
  br label %bb6

bb7:                                              ; preds = %bb10, %bb11
  %17 = load i8, ptr %_10, align 1
  %18 = trunc i8 %17 to i1
  br i1 %18, label %bb12, label %bb8

bb10:                                             ; preds = %bb11
  br label %bb7

bb8:                                              ; preds = %bb12, %bb7
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds i8, ptr %2, i64 8
  %21 = load i32, ptr %20, align 8
  %22 = insertvalue { ptr, i32 } poison, ptr %19, 0
  %23 = insertvalue { ptr, i32 } %22, i32 %21, 1
  resume { ptr, i32 } %23

bb12:                                             ; preds = %bb7
  br label %bb8

bb1:                                              ; No predecessors!
  unreachable
}

; core::ub_checks::is_nonoverlapping::runtime
; Function Attrs: inlinehint nonlazybind uwtable
define internal zeroext i1 @_ZN4core9ub_checks17is_nonoverlapping7runtime17he583fd8555f762a0E(ptr %src, ptr %dst, i64 %size, i64 %count) unnamed_addr #2 {
start:
  %0 = alloca [1 x i8], align 1
  %diff = alloca [8 x i8], align 8
  %_9 = alloca [16 x i8], align 8
  %src_usize = ptrtoint ptr %src to i64
  %dst_usize = ptrtoint ptr %dst to i64
  %1 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %size, i64 %count)
  %_15.0 = extractvalue { i64, i1 } %1, 0
  %_15.1 = extractvalue { i64, i1 } %1, 1
  %2 = call i1 @llvm.expect.i1(i1 %_15.1, i1 false)
  %3 = zext i1 %2 to i8
  store i8 %3, ptr %0, align 1
  %4 = load i8, ptr %0, align 1
  %_12 = trunc i8 %4 to i1
  br i1 %_12, label %bb2, label %bb3

bb3:                                              ; preds = %start
  %5 = getelementptr inbounds i8, ptr %_9, i64 8
  store i64 %_15.0, ptr %5, align 8
  store i64 1, ptr %_9, align 8
  %6 = getelementptr inbounds i8, ptr %_9, i64 8
  %size1 = load i64, ptr %6, align 8
  %_22 = icmp ult i64 %src_usize, %dst_usize
  br i1 %_22, label %bb4, label %bb5

bb2:                                              ; preds = %start
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h9f485ff9b02bac75E(ptr align 1 @alloc_763310d78c99c2c1ad3f8a9821e942f3, i64 61) #14
  unreachable

bb5:                                              ; preds = %bb3
  %7 = sub i64 %src_usize, %dst_usize
  store i64 %7, ptr %diff, align 8
  br label %bb6

bb4:                                              ; preds = %bb3
  %8 = sub i64 %dst_usize, %src_usize
  store i64 %8, ptr %diff, align 8
  br label %bb6

bb6:                                              ; preds = %bb4, %bb5
  %_11 = load i64, ptr %diff, align 8
  %_0 = icmp uge i64 %_11, %size1
  ret i1 %_0
}

; <T as alloc::slice::hack::ConvertVec>::to_vec
; Function Attrs: inlinehint nonlazybind uwtable
define void @"_ZN52_$LT$T$u20$as$u20$alloc..slice..hack..ConvertVec$GT$6to_vec17hfddcefe7e5af01c7E"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %s.0, i64 %s.1) unnamed_addr #2 {
start:
  %v = alloca [24 x i8], align 8
; call alloc::raw_vec::RawVecInner<A>::with_capacity_in
  %0 = call { i64, ptr } @"_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$16with_capacity_in17h7796f02f0f851ce7E"(i64 %s.1, i64 1, i64 1)
  %_10.0 = extractvalue { i64, ptr } %0, 0
  %_10.1 = extractvalue { i64, ptr } %0, 1
  store i64 %_10.0, ptr %v, align 8
  %1 = getelementptr inbounds i8, ptr %v, i64 8
  store ptr %_10.1, ptr %1, align 8
  %2 = getelementptr inbounds i8, ptr %v, i64 16
  store i64 0, ptr %2, align 8
  %3 = getelementptr inbounds i8, ptr %v, i64 8
  %self = load ptr, ptr %3, align 8
  br label %bb2

bb2:                                              ; preds = %start
; call core::intrinsics::copy_nonoverlapping::precondition_check
  call void @_ZN4core10intrinsics19copy_nonoverlapping18precondition_check17h5135f769150d7fa4E(ptr %s.0, ptr %self, i64 1, i64 1, i64 %s.1) #17
  br label %bb4

bb4:                                              ; preds = %bb2
  %4 = mul i64 %s.1, 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %self, ptr align 1 %s.0, i64 %4, i1 false)
  %5 = getelementptr inbounds i8, ptr %v, i64 16
  store i64 %s.1, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %v, i64 24, i1 false)
  ret void
}

; alloc::fmt::format
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @_ZN5alloc3fmt6format17h0021bf8834784395E(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %args) unnamed_addr #2 {
start:
  %_2 = alloca [16 x i8], align 8
  %_6.0 = load ptr, ptr %args, align 8
  %0 = getelementptr inbounds i8, ptr %args, i64 8
  %_6.1 = load i64, ptr %0, align 8
  %1 = getelementptr inbounds i8, ptr %args, i64 16
  %_7.0 = load ptr, ptr %1, align 8
  %2 = getelementptr inbounds i8, ptr %1, i64 8
  %_7.1 = load i64, ptr %2, align 8
  %3 = icmp eq i64 %_6.1, 0
  br i1 %3, label %bb4, label %bb5

bb4:                                              ; preds = %start
  %4 = icmp eq i64 %_7.1, 0
  br i1 %4, label %bb8, label %bb3

bb5:                                              ; preds = %start
  %5 = icmp eq i64 %_6.1, 1
  br i1 %5, label %bb6, label %bb3

bb8:                                              ; preds = %bb4
  store ptr inttoptr (i64 1 to ptr), ptr %_2, align 8
  %6 = getelementptr inbounds i8, ptr %_2, i64 8
  store i64 0, ptr %6, align 8
  br label %bb2

bb3:                                              ; preds = %bb6, %bb5, %bb4
  %7 = load ptr, ptr @0, align 8
  %8 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  store ptr %7, ptr %_2, align 8
  %9 = getelementptr inbounds i8, ptr %_2, i64 8
  store i64 %8, ptr %9, align 8
  br label %bb2

bb2:                                              ; preds = %bb3, %bb7, %bb8
  %10 = load ptr, ptr %_2, align 8
  %11 = getelementptr inbounds i8, ptr %_2, i64 8
  %12 = load i64, ptr %11, align 8
; call core::option::Option<T>::map_or_else
  call void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17h4072bc07b2dfcea1E"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %10, i64 %12, ptr align 8 %args)
  ret void

bb6:                                              ; preds = %bb5
  %13 = icmp eq i64 %_7.1, 0
  br i1 %13, label %bb7, label %bb3

bb7:                                              ; preds = %bb6
  %s = getelementptr inbounds [0 x { ptr, i64 }], ptr %_6.0, i64 0, i64 0
  %14 = getelementptr inbounds [0 x { ptr, i64 }], ptr %_6.0, i64 0, i64 0
  %_12.0 = load ptr, ptr %14, align 8
  %15 = getelementptr inbounds i8, ptr %14, i64 8
  %_12.1 = load i64, ptr %15, align 8
  store ptr %_12.0, ptr %_2, align 8
  %16 = getelementptr inbounds i8, ptr %_2, i64 8
  store i64 %_12.1, ptr %16, align 8
  br label %bb2
}

; alloc::fmt::format::{{closure}}
; Function Attrs: inlinehint nonlazybind uwtable
define void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17h6da84f85bc8f63f5E"(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %_1) unnamed_addr #2 {
start:
  %_2 = alloca [48 x i8], align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_2, ptr align 8 %_1, i64 48, i1 false)
; call alloc::fmt::format::format_inner
  call void @_ZN5alloc3fmt6format12format_inner17he4e5360ab424817dE(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %_2)
  ret void
}

; alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17ha022a01d6f63f505E"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %self.0, i64 %self.1) unnamed_addr #2 {
start:
  %bytes = alloca [24 x i8], align 8
; call <T as alloc::slice::hack::ConvertVec>::to_vec
  call void @"_ZN52_$LT$T$u20$as$u20$alloc..slice..hack..ConvertVec$GT$6to_vec17hfddcefe7e5af01c7E"(ptr sret([24 x i8]) align 8 %bytes, ptr align 1 %self.0, i64 %self.1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %bytes, i64 24, i1 false)
  ret void
}

; alloc::alloc::alloc
; Function Attrs: inlinehint nonlazybind uwtable
define internal ptr @_ZN5alloc5alloc5alloc17hcc32dbc235516f1eE(i64 %0, i64 %1) unnamed_addr #2 {
start:
  %2 = alloca [1 x i8], align 1
  %_11 = alloca [8 x i8], align 8
  %layout = alloca [16 x i8], align 8
  store i64 %0, ptr %layout, align 8
  %3 = getelementptr inbounds i8, ptr %layout, i64 8
  store i64 %1, ptr %3, align 8
  br label %bb3

bb3:                                              ; preds = %start
; call core::ptr::read_volatile::precondition_check
  call void @_ZN4core3ptr13read_volatile18precondition_check17h5d86a02be90fec5cE(ptr @__rust_no_alloc_shim_is_unstable, i64 1) #17
  br label %bb5

bb5:                                              ; preds = %bb3
  %4 = load volatile i8, ptr @__rust_no_alloc_shim_is_unstable, align 1
  store i8 %4, ptr %2, align 1
  %_2 = load i8, ptr %2, align 1
  %5 = getelementptr inbounds i8, ptr %layout, i64 8
  %_3 = load i64, ptr %5, align 8
  %self = load i64, ptr %layout, align 8
  store i64 %self, ptr %_11, align 8
  %_12 = load i64, ptr %_11, align 8
  %_13 = icmp uge i64 %_12, 1
  %_14 = icmp ule i64 %_12, -9223372036854775808
  %_15 = and i1 %_13, %_14
  %_0 = call ptr @__rust_alloc(i64 %_3, i64 %_12) #17
  ret ptr %_0
}

; alloc::alloc::Global::alloc_impl
; Function Attrs: inlinehint nonlazybind uwtable
define internal { ptr, i64 } @_ZN5alloc5alloc6Global10alloc_impl17h290314d5c5f0cae2E(ptr align 1 %self, i64 %0, i64 %1, i1 zeroext %zeroed) unnamed_addr #2 {
start:
  %_38 = alloca [8 x i8], align 8
  %data4 = alloca [8 x i8], align 8
  %ptr = alloca [16 x i8], align 8
  %_28 = alloca [8 x i8], align 8
  %_20 = alloca [8 x i8], align 8
  %self3 = alloca [8 x i8], align 8
  %self2 = alloca [8 x i8], align 8
  %_11 = alloca [8 x i8], align 8
  %layout1 = alloca [16 x i8], align 8
  %raw_ptr = alloca [8 x i8], align 8
  %data = alloca [8 x i8], align 8
  %_0 = alloca [16 x i8], align 8
  %layout = alloca [16 x i8], align 8
  store i64 %0, ptr %layout, align 8
  %2 = getelementptr inbounds i8, ptr %layout, i64 8
  store i64 %1, ptr %2, align 8
  %3 = getelementptr inbounds i8, ptr %layout, i64 8
  %size = load i64, ptr %3, align 8
  %4 = icmp eq i64 %size, 0
  br i1 %4, label %bb2, label %bb1

bb2:                                              ; preds = %start
  %self5 = load i64, ptr %layout, align 8
  store i64 %self5, ptr %_20, align 8
  %_21 = load i64, ptr %_20, align 8
  %_22 = icmp uge i64 %_21, 1
  %_23 = icmp ule i64 %_21, -9223372036854775808
  %_24 = and i1 %_22, %_23
  %ptr6 = getelementptr i8, ptr null, i64 %_21
  br label %bb7

bb1:                                              ; preds = %start
  br i1 %zeroed, label %bb3, label %bb4

bb7:                                              ; preds = %bb2
; call core::ptr::non_null::NonNull<T>::new_unchecked::precondition_check
  call void @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17hfbf37ed5012b753fE"(ptr %ptr6) #17
  store ptr %ptr6, ptr %_28, align 8
  %5 = load ptr, ptr %_28, align 8
  store ptr %5, ptr %data, align 8
  store ptr %ptr6, ptr %data4, align 8
  store ptr %ptr6, ptr %ptr, align 8
  %6 = getelementptr inbounds i8, ptr %ptr, i64 8
  store i64 0, ptr %6, align 8
  br label %bb10

bb9:                                              ; No predecessors!
  unreachable

bb10:                                             ; preds = %bb7
; call core::ptr::non_null::NonNull<T>::new_unchecked::precondition_check
  call void @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17hfbf37ed5012b753fE"(ptr %ptr6) #17
  br label %bb12

bb12:                                             ; preds = %bb10
  %_33.0 = load ptr, ptr %ptr, align 8
  %7 = getelementptr inbounds i8, ptr %ptr, i64 8
  %_33.1 = load i64, ptr %7, align 8
  store ptr %_33.0, ptr %_0, align 8
  %8 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %_33.1, ptr %8, align 8
  br label %bb6

bb6:                                              ; preds = %bb21, %bb14, %bb12
  %9 = load ptr, ptr %_0, align 8
  %10 = getelementptr inbounds i8, ptr %_0, i64 8
  %11 = load i64, ptr %10, align 8
  %12 = insertvalue { ptr, i64 } poison, ptr %9, 0
  %13 = insertvalue { ptr, i64 } %12, i64 %11, 1
  ret { ptr, i64 } %13

bb4:                                              ; preds = %bb1
  %14 = load i64, ptr %layout, align 8
  %15 = getelementptr inbounds i8, ptr %layout, i64 8
  %16 = load i64, ptr %15, align 8
; call alloc::alloc::alloc
  %17 = call ptr @_ZN5alloc5alloc5alloc17hcc32dbc235516f1eE(i64 %14, i64 %16)
  store ptr %17, ptr %raw_ptr, align 8
  br label %bb5

bb3:                                              ; preds = %bb1
  %18 = load i64, ptr %layout, align 8
  %19 = getelementptr inbounds i8, ptr %layout, i64 8
  %20 = load i64, ptr %19, align 8
  store i64 %18, ptr %layout1, align 8
  %21 = getelementptr inbounds i8, ptr %layout1, i64 8
  store i64 %20, ptr %21, align 8
  %self7 = load i64, ptr %layout, align 8
  store i64 %self7, ptr %_38, align 8
  %_39 = load i64, ptr %_38, align 8
  %_40 = icmp uge i64 %_39, 1
  %_41 = icmp ule i64 %_39, -9223372036854775808
  %_42 = and i1 %_40, %_41
  %22 = call ptr @__rust_alloc_zeroed(i64 %size, i64 %_39) #17
  store ptr %22, ptr %raw_ptr, align 8
  br label %bb5

bb5:                                              ; preds = %bb3, %bb4
  %ptr8 = load ptr, ptr %raw_ptr, align 8
  %_44 = ptrtoint ptr %ptr8 to i64
  %23 = icmp eq i64 %_44, 0
  br i1 %23, label %bb14, label %bb15

bb14:                                             ; preds = %bb5
  store ptr null, ptr %self3, align 8
  store ptr null, ptr %self2, align 8
  %24 = load ptr, ptr @0, align 8
  %25 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  store ptr %24, ptr %_0, align 8
  %26 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %25, ptr %26, align 8
  br label %bb6

bb15:                                             ; preds = %bb5
  br label %bb16

bb16:                                             ; preds = %bb15
; call core::ptr::non_null::NonNull<T>::new_unchecked::precondition_check
  call void @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17hfbf37ed5012b753fE"(ptr %ptr8) #17
  br label %bb18

bb18:                                             ; preds = %bb16
  store ptr %ptr8, ptr %self3, align 8
  %v = load ptr, ptr %self3, align 8
  store ptr %v, ptr %self2, align 8
  %v9 = load ptr, ptr %self2, align 8
  store ptr %v9, ptr %_11, align 8
  %ptr10 = load ptr, ptr %_11, align 8
  br label %bb19

bb19:                                             ; preds = %bb18
; call core::ptr::non_null::NonNull<T>::new_unchecked::precondition_check
  call void @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked18precondition_check17hfbf37ed5012b753fE"(ptr %ptr10) #17
  br label %bb21

bb21:                                             ; preds = %bb19
  store ptr %ptr10, ptr %_0, align 8
  %27 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %size, ptr %27, align 8
  br label %bb6
}

; alloc::raw_vec::RawVecInner<A>::deallocate
; Function Attrs: nonlazybind uwtable
define void @"_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17h0075097f65290026E"(ptr align 8 %self, i64 %elem_layout.0, i64 %elem_layout.1) unnamed_addr #3 {
start:
  %_3 = alloca [24 x i8], align 8
; call alloc::raw_vec::RawVecInner<A>::current_memory
  call void @"_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14current_memory17h2561cfdee6bc6e61E"(ptr sret([24 x i8]) align 8 %_3, ptr align 8 %self, i64 %elem_layout.0, i64 %elem_layout.1)
  %0 = getelementptr inbounds i8, ptr %_3, i64 8
  %1 = load i64, ptr %0, align 8
  %2 = icmp eq i64 %1, 0
  %_5 = select i1 %2, i64 0, i64 1
  %3 = icmp eq i64 %_5, 1
  br i1 %3, label %bb2, label %bb4

bb2:                                              ; preds = %start
  %ptr = load ptr, ptr %_3, align 8
  %4 = getelementptr inbounds i8, ptr %_3, i64 8
  %layout.0 = load i64, ptr %4, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 8
  %layout.1 = load i64, ptr %5, align 8
  %_9 = getelementptr inbounds i8, ptr %self, i64 16
; call <alloc::alloc::Global as core::alloc::Allocator>::deallocate
  call void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17hdd2a29f5a3faa41fE"(ptr align 1 %_9, ptr %ptr, i64 %layout.0, i64 %layout.1)
  br label %bb4

bb4:                                              ; preds = %bb2, %start
  ret void

bb5:                                              ; No predecessors!
  unreachable
}

; alloc::raw_vec::RawVecInner<A>::current_memory
; Function Attrs: inlinehint nonlazybind uwtable
define void @"_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14current_memory17h2561cfdee6bc6e61E"(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %self, i64 %0, i64 %1) unnamed_addr #2 {
start:
  %_21 = alloca [1 x i8], align 1
  %_20 = alloca [1 x i8], align 1
  %_19 = alloca [1 x i8], align 1
  %_18 = alloca [8 x i8], align 8
  %_17 = alloca [8 x i8], align 8
  %self2 = alloca [8 x i8], align 8
  %_13 = alloca [24 x i8], align 8
  %self1 = alloca [8 x i8], align 8
  %align = alloca [8 x i8], align 8
  %size = alloca [8 x i8], align 8
  %alloc_size = alloca [8 x i8], align 8
  %elem_layout = alloca [16 x i8], align 8
  store i64 %0, ptr %elem_layout, align 8
  %2 = getelementptr inbounds i8, ptr %elem_layout, i64 8
  store i64 %1, ptr %2, align 8
  %3 = getelementptr inbounds i8, ptr %elem_layout, i64 8
  %self3 = load i64, ptr %3, align 8
  %4 = icmp eq i64 %self3, 0
  br i1 %4, label %bb3, label %bb1

bb3:                                              ; preds = %bb2, %start
  %5 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 0, ptr %5, align 8
  br label %bb5

bb1:                                              ; preds = %start
  %_5 = load i64, ptr %self, align 8
  %6 = icmp eq i64 %_5, 0
  br i1 %6, label %bb2, label %bb4

bb2:                                              ; preds = %bb1
  br label %bb3

bb4:                                              ; preds = %bb1
  %rhs = load i64, ptr %self, align 8
  br label %bb6

bb5:                                              ; preds = %bb9, %bb3
  ret void

bb6:                                              ; preds = %bb4
; call core::num::<impl usize>::unchecked_mul::precondition_check
  call void @"_ZN4core3num23_$LT$impl$u20$usize$GT$13unchecked_mul18precondition_check17hda9a48884c47fa2fE"(i64 %self3, i64 %rhs) #17
  %7 = mul nuw i64 %self3, %rhs
  store i64 %7, ptr %alloc_size, align 8
  %8 = load i64, ptr %alloc_size, align 8
  store i64 %8, ptr %size, align 8
  store ptr %elem_layout, ptr %self1, align 8
  %9 = load i64, ptr %elem_layout, align 8
  store i64 %9, ptr %self2, align 8
  %10 = load i64, ptr %self2, align 8
  store i64 %10, ptr %_17, align 8
  %11 = load i64, ptr %_17, align 8
  store i64 %11, ptr %_18, align 8
  %12 = load i64, ptr %_18, align 8
  %13 = icmp uge i64 %12, 1
  %14 = zext i1 %13 to i8
  store i8 %14, ptr %_19, align 1
  %15 = load i64, ptr %_18, align 8
  %16 = icmp ule i64 %15, -9223372036854775808
  %17 = zext i1 %16 to i8
  store i8 %17, ptr %_20, align 1
  %18 = load i8, ptr %_19, align 1
  %19 = trunc i8 %18 to i1
  %20 = load i8, ptr %_20, align 1
  %21 = trunc i8 %20 to i1
  %22 = and i1 %19, %21
  %23 = zext i1 %22 to i8
  store i8 %23, ptr %_21, align 1
  %24 = load i64, ptr %_18, align 8
  store i64 %24, ptr %align, align 8
  br label %bb8

bb7:                                              ; No predecessors!
  unreachable

bb8:                                              ; preds = %bb6
  %25 = load i64, ptr %alloc_size, align 8
  %26 = load i64, ptr %align, align 8
; call core::alloc::layout::Layout::from_size_align_unchecked::precondition_check
  call void @_ZN4core5alloc6layout6Layout25from_size_align_unchecked18precondition_check17h0b1e299b8eb6081bE(i64 %25, i64 %26) #17
  br label %bb9

bb9:                                              ; preds = %bb8
  %_23 = load i64, ptr %align, align 8
  %layout.1 = load i64, ptr %alloc_size, align 8
  %27 = getelementptr inbounds i8, ptr %self, i64 8
  %self4 = load ptr, ptr %27, align 8
  store ptr %self4, ptr %_13, align 8
  %28 = getelementptr inbounds i8, ptr %_13, i64 8
  store i64 %_23, ptr %28, align 8
  %29 = getelementptr inbounds i8, ptr %28, i64 8
  store i64 %layout.1, ptr %29, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %_13, i64 24, i1 false)
  br label %bb5
}

; alloc::raw_vec::RawVecInner<A>::try_allocate_in
; Function Attrs: nonlazybind uwtable
define void @"_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$15try_allocate_in17h54dde8c99568a938E"(ptr sret([24 x i8]) align 8 %_0, i64 %capacity, i1 zeroext %0, i64 %1, i64 %2) unnamed_addr #3 personality ptr @rust_eh_personality {
start:
  %3 = alloca [16 x i8], align 8
  %_38 = alloca [8 x i8], align 8
  %self3 = alloca [24 x i8], align 8
  %self2 = alloca [16 x i8], align 8
  %self = alloca [16 x i8], align 8
  %result = alloca [16 x i8], align 8
  %elem_layout1 = alloca [16 x i8], align 8
  %_6 = alloca [24 x i8], align 8
  %layout = alloca [16 x i8], align 8
  %elem_layout = alloca [16 x i8], align 8
  %alloc = alloca [0 x i8], align 1
  %init = alloca [1 x i8], align 1
  %4 = zext i1 %0 to i8
  store i8 %4, ptr %init, align 1
  store i64 %1, ptr %elem_layout, align 8
  %5 = getelementptr inbounds i8, ptr %elem_layout, i64 8
  store i64 %2, ptr %5, align 8
  %6 = load i64, ptr %elem_layout, align 8
  %7 = getelementptr inbounds i8, ptr %elem_layout, i64 8
  %8 = load i64, ptr %7, align 8
  store i64 %6, ptr %elem_layout1, align 8
  %9 = getelementptr inbounds i8, ptr %elem_layout1, i64 8
  store i64 %8, ptr %9, align 8
; invoke core::alloc::layout::Layout::repeat
  invoke void @_ZN4core5alloc6layout6Layout6repeat17h00183f082c875b5eE(ptr sret([24 x i8]) align 8 %self3, ptr align 8 %elem_layout1, i64 %capacity)
          to label %bb16 unwind label %cleanup

bb15:                                             ; preds = %cleanup
  br label %bb14

cleanup:                                          ; preds = %bb4, %bb5, %start
  %10 = landingpad { ptr, i32 }
          cleanup
  %11 = extractvalue { ptr, i32 } %10, 0
  %12 = extractvalue { ptr, i32 } %10, 1
  store ptr %11, ptr %3, align 8
  %13 = getelementptr inbounds i8, ptr %3, i64 8
  store i32 %12, ptr %13, align 8
  br label %bb15

bb16:                                             ; preds = %start
  %14 = load i64, ptr %self3, align 8
  %15 = icmp eq i64 %14, 0
  %_33 = select i1 %15, i64 1, i64 0
  %16 = icmp eq i64 %_33, 0
  br i1 %16, label %bb18, label %bb17

bb18:                                             ; preds = %bb16
  %t.0 = load i64, ptr %self3, align 8
  %17 = getelementptr inbounds i8, ptr %self3, i64 8
  %t.1 = load i64, ptr %17, align 8
  %18 = getelementptr inbounds i8, ptr %self3, i64 16
  %t = load i64, ptr %18, align 8
  store i64 %t.0, ptr %self2, align 8
  %19 = getelementptr inbounds i8, ptr %self2, i64 8
  store i64 %t.1, ptr %19, align 8
  %t.04 = load i64, ptr %self2, align 8
  %20 = getelementptr inbounds i8, ptr %self2, i64 8
  %t.15 = load i64, ptr %20, align 8
  %21 = getelementptr inbounds i8, ptr %_6, i64 8
  store i64 %t.04, ptr %21, align 8
  %22 = getelementptr inbounds i8, ptr %21, i64 8
  store i64 %t.15, ptr %22, align 8
  store i64 0, ptr %_6, align 8
  %23 = getelementptr inbounds i8, ptr %_6, i64 8
  %layout.0 = load i64, ptr %23, align 8
  %24 = getelementptr inbounds i8, ptr %23, i64 8
  %layout.1 = load i64, ptr %24, align 8
  store i64 %layout.0, ptr %layout, align 8
  %25 = getelementptr inbounds i8, ptr %layout, i64 8
  store i64 %layout.1, ptr %25, align 8
  %26 = icmp eq i64 %layout.1, 0
  br i1 %26, label %bb2, label %bb3

bb17:                                             ; preds = %bb16
  %27 = load i64, ptr @0, align 8
  %28 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  store i64 %27, ptr %self2, align 8
  %29 = getelementptr inbounds i8, ptr %self2, i64 8
  store i64 %28, ptr %29, align 8
  %30 = load i64, ptr @0, align 8
  %31 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  %32 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %30, ptr %32, align 8
  %33 = getelementptr inbounds i8, ptr %32, i64 8
  store i64 %31, ptr %33, align 8
  store i64 1, ptr %_0, align 8
  br label %bb13

bb2:                                              ; preds = %bb18
  %self6 = load i64, ptr %elem_layout, align 8
  store i64 %self6, ptr %_38, align 8
  %_39 = load i64, ptr %_38, align 8
  %_40 = icmp uge i64 %_39, 1
  %_41 = icmp ule i64 %_39, -9223372036854775808
  %_42 = and i1 %_40, %_41
  %ptr = getelementptr i8, ptr null, i64 %_39
  %34 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 0, ptr %34, align 8
  %35 = getelementptr inbounds i8, ptr %34, i64 8
  store ptr %ptr, ptr %35, align 8
  store i64 0, ptr %_0, align 8
  br label %bb11

bb3:                                              ; preds = %bb18
  %36 = load i8, ptr %init, align 1
  %37 = trunc i8 %36 to i1
  %_17 = zext i1 %37 to i64
  %38 = icmp eq i64 %_17, 0
  br i1 %38, label %bb5, label %bb4

bb11:                                             ; preds = %bb13, %bb10, %bb2
  ret void

bb5:                                              ; preds = %bb3
; invoke <alloc::alloc::Global as core::alloc::Allocator>::allocate
  %39 = invoke { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17h043e44a3b1eded13E"(ptr align 1 %alloc, i64 %layout.0, i64 %layout.1)
          to label %bb6 unwind label %cleanup

bb4:                                              ; preds = %bb3
; invoke <alloc::alloc::Global as core::alloc::Allocator>::allocate_zeroed
  %40 = invoke { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17h1f1a8cd46745fd55E"(ptr align 1 %alloc, i64 %layout.0, i64 %layout.1)
          to label %bb7 unwind label %cleanup

bb6:                                              ; preds = %bb5
  %41 = extractvalue { ptr, i64 } %39, 0
  %42 = extractvalue { ptr, i64 } %39, 1
  store ptr %41, ptr %result, align 8
  %43 = getelementptr inbounds i8, ptr %result, i64 8
  store i64 %42, ptr %43, align 8
  br label %bb8

bb8:                                              ; preds = %bb7, %bb6
  %44 = load ptr, ptr %result, align 8
  %45 = ptrtoint ptr %44 to i64
  %46 = icmp eq i64 %45, 0
  %_20 = select i1 %46, i64 1, i64 0
  %47 = icmp eq i64 %_20, 0
  br i1 %47, label %bb10, label %bb9

bb7:                                              ; preds = %bb4
  %48 = extractvalue { ptr, i64 } %40, 0
  %49 = extractvalue { ptr, i64 } %40, 1
  store ptr %48, ptr %result, align 8
  %50 = getelementptr inbounds i8, ptr %result, i64 8
  store i64 %49, ptr %50, align 8
  br label %bb8

bb10:                                             ; preds = %bb8
  %ptr.0 = load ptr, ptr %result, align 8
  %51 = getelementptr inbounds i8, ptr %result, i64 8
  %ptr.1 = load i64, ptr %51, align 8
  %52 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %capacity, ptr %52, align 8
  %53 = getelementptr inbounds i8, ptr %52, i64 8
  store ptr %ptr.0, ptr %53, align 8
  store i64 0, ptr %_0, align 8
  br label %bb11

bb9:                                              ; preds = %bb8
  store i64 %layout.0, ptr %self, align 8
  %54 = getelementptr inbounds i8, ptr %self, i64 8
  store i64 %layout.1, ptr %54, align 8
  %_22.0 = load i64, ptr %self, align 8
  %55 = getelementptr inbounds i8, ptr %self, i64 8
  %_22.1 = load i64, ptr %55, align 8
  %56 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %_22.0, ptr %56, align 8
  %57 = getelementptr inbounds i8, ptr %56, i64 8
  store i64 %_22.1, ptr %57, align 8
  store i64 1, ptr %_0, align 8
  br label %bb13

bb13:                                             ; preds = %bb17, %bb9
  br label %bb11

bb1:                                              ; No predecessors!
  unreachable

bb14:                                             ; preds = %bb15
  br label %bb12

bb12:                                             ; preds = %bb14
  %58 = load ptr, ptr %3, align 8
  %59 = getelementptr inbounds i8, ptr %3, i64 8
  %60 = load i32, ptr %59, align 8
  %61 = insertvalue { ptr, i32 } poison, ptr %58, 0
  %62 = insertvalue { ptr, i32 } %61, i32 %60, 1
  resume { ptr, i32 } %62
}

; alloc::raw_vec::RawVecInner<A>::with_capacity_in
; Function Attrs: inlinehint nonlazybind uwtable
define { i64, ptr } @"_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$16with_capacity_in17h7796f02f0f851ce7E"(i64 %capacity, i64 %elem_layout.0, i64 %elem_layout.1) unnamed_addr #2 {
start:
  %self = alloca [8 x i8], align 8
  %elem_layout = alloca [16 x i8], align 8
  %this = alloca [16 x i8], align 8
  %_4 = alloca [24 x i8], align 8
; call alloc::raw_vec::RawVecInner<A>::try_allocate_in
  call void @"_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$15try_allocate_in17h54dde8c99568a938E"(ptr sret([24 x i8]) align 8 %_4, i64 %capacity, i1 zeroext false, i64 %elem_layout.0, i64 %elem_layout.1)
  %_5 = load i64, ptr %_4, align 8
  %0 = icmp eq i64 %_5, 0
  br i1 %0, label %bb4, label %bb3

bb4:                                              ; preds = %start
  %1 = getelementptr inbounds i8, ptr %_4, i64 8
  %2 = load i64, ptr %1, align 8
  %3 = getelementptr inbounds i8, ptr %1, i64 8
  %4 = load ptr, ptr %3, align 8
  store i64 %2, ptr %this, align 8
  %5 = getelementptr inbounds i8, ptr %this, i64 8
  store ptr %4, ptr %5, align 8
  store i64 %elem_layout.0, ptr %elem_layout, align 8
  %6 = getelementptr inbounds i8, ptr %elem_layout, i64 8
  store i64 %elem_layout.1, ptr %6, align 8
  %7 = icmp eq i64 %elem_layout.1, 0
  br i1 %7, label %bb6, label %bb7

bb3:                                              ; preds = %start
  %8 = getelementptr inbounds i8, ptr %_4, i64 8
  %err.0 = load i64, ptr %8, align 8
  %9 = getelementptr inbounds i8, ptr %8, i64 8
  %err.1 = load i64, ptr %9, align 8
; call alloc::raw_vec::handle_error
  call void @_ZN5alloc7raw_vec12handle_error17he4316ba2e8167751E(i64 %err.0, i64 %err.1) #13
  unreachable

bb6:                                              ; preds = %bb4
  store i64 -1, ptr %self, align 8
  br label %bb5

bb7:                                              ; preds = %bb4
  %10 = load i64, ptr %this, align 8
  store i64 %10, ptr %self, align 8
  br label %bb5

bb5:                                              ; preds = %bb7, %bb6
  %11 = load i64, ptr %self, align 8
  %_13 = sub i64 %11, 0
  %_8 = icmp ugt i64 %capacity, %_13
  %cond = xor i1 %_8, true
  br label %bb8

bb8:                                              ; preds = %bb5
; call core::hint::assert_unchecked::precondition_check
  call void @_ZN4core4hint16assert_unchecked18precondition_check17h30a1808f02ab3051E(i1 zeroext %cond) #17
  br label %bb9

bb9:                                              ; preds = %bb8
  %_0.0 = load i64, ptr %this, align 8
  %12 = getelementptr inbounds i8, ptr %this, i64 8
  %_0.1 = load ptr, ptr %12, align 8
  %13 = insertvalue { i64, ptr } poison, i64 %_0.0, 0
  %14 = insertvalue { i64, ptr } %13, ptr %_0.1, 1
  ret { i64, ptr } %14

bb2:                                              ; No predecessors!
  unreachable
}

; <alloc::alloc::Global as core::alloc::Allocator>::deallocate
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17hdd2a29f5a3faa41fE"(ptr align 1 %self, ptr %ptr, i64 %0, i64 %1) unnamed_addr #2 {
start:
  %_13 = alloca [8 x i8], align 8
  %layout1 = alloca [16 x i8], align 8
  %layout = alloca [16 x i8], align 8
  store i64 %0, ptr %layout, align 8
  %2 = getelementptr inbounds i8, ptr %layout, i64 8
  store i64 %1, ptr %2, align 8
  %3 = getelementptr inbounds i8, ptr %layout, i64 8
  %_4 = load i64, ptr %3, align 8
  %4 = icmp eq i64 %_4, 0
  br i1 %4, label %bb2, label %bb1

bb2:                                              ; preds = %bb1, %start
  ret void

bb1:                                              ; preds = %start
  %5 = load i64, ptr %layout, align 8
  %6 = getelementptr inbounds i8, ptr %layout, i64 8
  %7 = load i64, ptr %6, align 8
  store i64 %5, ptr %layout1, align 8
  %8 = getelementptr inbounds i8, ptr %layout1, i64 8
  store i64 %7, ptr %8, align 8
  %self2 = load i64, ptr %layout, align 8
  store i64 %self2, ptr %_13, align 8
  %_14 = load i64, ptr %_13, align 8
  %_15 = icmp uge i64 %_14, 1
  %_16 = icmp ule i64 %_14, -9223372036854775808
  %_17 = and i1 %_15, %_16
  call void @__rust_dealloc(ptr %ptr, i64 %_4, i64 %_14) #17
  br label %bb2
}

; <alloc::alloc::Global as core::alloc::Allocator>::allocate_zeroed
; Function Attrs: inlinehint nonlazybind uwtable
define internal { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17h1f1a8cd46745fd55E"(ptr align 1 %self, i64 %layout.0, i64 %layout.1) unnamed_addr #2 {
start:
; call alloc::alloc::Global::alloc_impl
  %0 = call { ptr, i64 } @_ZN5alloc5alloc6Global10alloc_impl17h290314d5c5f0cae2E(ptr align 1 %self, i64 %layout.0, i64 %layout.1, i1 zeroext true)
  %_0.0 = extractvalue { ptr, i64 } %0, 0
  %_0.1 = extractvalue { ptr, i64 } %0, 1
  %1 = insertvalue { ptr, i64 } poison, ptr %_0.0, 0
  %2 = insertvalue { ptr, i64 } %1, i64 %_0.1, 1
  ret { ptr, i64 } %2
}

; <alloc::alloc::Global as core::alloc::Allocator>::allocate
; Function Attrs: inlinehint nonlazybind uwtable
define internal { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17h043e44a3b1eded13E"(ptr align 1 %self, i64 %layout.0, i64 %layout.1) unnamed_addr #2 {
start:
; call alloc::alloc::Global::alloc_impl
  %0 = call { ptr, i64 } @_ZN5alloc5alloc6Global10alloc_impl17h290314d5c5f0cae2E(ptr align 1 %self, i64 %layout.0, i64 %layout.1, i1 zeroext false)
  %_0.0 = extractvalue { ptr, i64 } %0, 0
  %_0.1 = extractvalue { ptr, i64 } %0, 1
  %1 = insertvalue { ptr, i64 } poison, ptr %_0.0, 0
  %2 = insertvalue { ptr, i64 } %1, i64 %_0.1, 1
  ret { ptr, i64 } %2
}

; <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: nonlazybind uwtable
define void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h9ac301fe34baeea9E"(ptr align 8 %self) unnamed_addr #3 {
start:
  %0 = getelementptr inbounds i8, ptr %self, i64 8
  %self1 = load ptr, ptr %0, align 8
  %1 = getelementptr inbounds i8, ptr %self, i64 16
  %len = load i64, ptr %1, align 8
  ret void
}

; <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: nonlazybind uwtable
define void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hcd26217cb274d262E"(ptr align 8 %self) unnamed_addr #3 {
start:
; call alloc::raw_vec::RawVecInner<A>::deallocate
  call void @"_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$10deallocate17h0075097f65290026E"(ptr align 8 %self, i64 1, i64 1)
  ret void
}

; autocfg_f9731b0197401245_1::probe
; Function Attrs: nonlazybind uwtable
define void @_ZN26autocfg_f9731b0197401245_15probe17h95ca893ce5af1160E() unnamed_addr #3 {
start:
  %_3.i = alloca [16 x i8], align 8
  %_7 = alloca [16 x i8], align 8
  %_6 = alloca [16 x i8], align 8
  %_3 = alloca [48 x i8], align 8
  %res = alloca [24 x i8], align 8
  %_1 = alloca [24 x i8], align 8
  store ptr @alloc_53973d2fe29b4adba8bb7390b5678745, ptr %_3.i, align 8
  %0 = getelementptr inbounds i8, ptr %_3.i, i64 8
  store ptr @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17h045e096530091592E", ptr %0, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_7, ptr align 8 %_3.i, i64 16, i1 false)
  %1 = getelementptr inbounds [1 x %"core::fmt::rt::Argument<'_>"], ptr %_6, i64 0, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %1, ptr align 8 %_7, i64 16, i1 false)
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h5368b5b1c007a8e2E(ptr sret([48 x i8]) align 8 %_3, ptr align 8 @alloc_b99730e73100e73a81f4fbfe74b3821d, ptr align 8 %_6)
; call alloc::fmt::format
  call void @_ZN5alloc3fmt6format17h0021bf8834784395E(ptr sret([24 x i8]) align 8 %res, ptr align 8 %_3)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_1, ptr align 8 %res, i64 24, i1 false)
; call core::ptr::drop_in_place<alloc::string::String>
  call void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h253e530b660d780bE"(ptr align 8 %_1)
  ret void
}

; Function Attrs: nounwind nonlazybind uwtable
declare i32 @rust_eh_personality(i32, i32, i64, ptr, ptr) unnamed_addr #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctpop.i64(i64) #4

; core::panicking::panic_cannot_unwind
; Function Attrs: cold noinline noreturn nounwind nonlazybind uwtable
declare void @_ZN4core9panicking19panic_cannot_unwind17hea865182d7ce50afE() unnamed_addr #5

; core::panicking::panic_nounwind
; Function Attrs: cold noinline noreturn nounwind nonlazybind uwtable
declare void @_ZN4core9panicking14panic_nounwind17h9f485ff9b02bac75E(ptr align 1, i64) unnamed_addr #5

; core::panicking::panic_fmt
; Function Attrs: cold noinline noreturn nonlazybind uwtable
declare void @_ZN4core9panicking9panic_fmt17h3eea515d05f7a35eE(ptr align 8, ptr align 8) unnamed_addr #6

; core::fmt::num::imp::<impl core::fmt::LowerExp for isize>::fmt
; Function Attrs: nonlazybind uwtable
declare zeroext i1 @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17h045e096530091592E"(ptr align 8, ptr align 8) unnamed_addr #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #4

; core::panicking::panic_in_cleanup
; Function Attrs: cold noinline noreturn nounwind nonlazybind uwtable
declare void @_ZN4core9panicking16panic_in_cleanup17hb6fcb0ed7ad330b7E() unnamed_addr #5

; core::alloc::layout::Layout::is_size_align_valid
; Function Attrs: nonlazybind uwtable
declare zeroext i1 @_ZN4core5alloc6layout6Layout19is_size_align_valid17h27157fff07002cf3E(i64, i64) unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i1 @llvm.expect.i1(i1, i1) #8

; alloc::fmt::format::format_inner
; Function Attrs: nonlazybind uwtable
declare void @_ZN5alloc3fmt6format12format_inner17he4e5360ab424817dE(ptr sret([24 x i8]) align 8, ptr align 8) unnamed_addr #3

; Function Attrs: nounwind nonlazybind allockind("alloc,uninitialized,aligned") allocsize(0) uwtable
declare noalias ptr @__rust_alloc(i64, i64 allocalign) unnamed_addr #9

; Function Attrs: nounwind nonlazybind allockind("alloc,zeroed,aligned") allocsize(0) uwtable
declare noalias ptr @__rust_alloc_zeroed(i64, i64 allocalign) unnamed_addr #10

; alloc::raw_vec::handle_error
; Function Attrs: cold noreturn nonlazybind uwtable
declare void @_ZN5alloc7raw_vec12handle_error17he4316ba2e8167751E(i64, i64) unnamed_addr #11

; Function Attrs: nounwind nonlazybind allockind("free") uwtable
declare void @__rust_dealloc(ptr allocptr, i64, i64) unnamed_addr #12

attributes #0 = { inlinehint nounwind nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #1 = { nounwind nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #2 = { inlinehint nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #3 = { nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { cold noinline noreturn nounwind nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #6 = { cold noinline noreturn nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #9 = { nounwind nonlazybind allockind("alloc,uninitialized,aligned") allocsize(0) uwtable "alloc-family"="__rust_alloc" "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #10 = { nounwind nonlazybind allockind("alloc,zeroed,aligned") allocsize(0) uwtable "alloc-family"="__rust_alloc" "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #11 = { cold noreturn nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #12 = { nounwind nonlazybind allockind("free") uwtable "alloc-family"="__rust_alloc" "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #13 = { noreturn }
attributes #14 = { noreturn nounwind }
attributes #15 = { cold noreturn nounwind }
attributes #16 = { cold }
attributes #17 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.82.0 (f6e511eec 2024-10-15)"}
