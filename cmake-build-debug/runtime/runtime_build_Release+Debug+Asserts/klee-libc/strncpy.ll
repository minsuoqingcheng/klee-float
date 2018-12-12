; ModuleID = '/home/unix-lc/klee-float/runtime/klee-libc/strncpy.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i8* @strncpy(i8* %dst, i8* nocapture readonly %src, i64 %n) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %dst}, i64 0, metadata !15), !dbg !25
  tail call void @llvm.dbg.value(metadata !{i8* %src}, i64 0, metadata !16), !dbg !25
  tail call void @llvm.dbg.value(metadata !{i64 %n}, i64 0, metadata !17), !dbg !25
  %cmp = icmp eq i64 %n, 0, !dbg !26
  br i1 %cmp, label %if.end11, label %do.body, !dbg !26

do.body:                                          ; preds = %entry, %do.cond
  %indvar = phi i64 [ %indvar.next, %do.cond ], [ 0, %entry ]
  %n.addr.0 = phi i64 [ %dec8, %do.cond ], [ %n, %entry ]
  %d.0 = phi i8* [ %incdec.ptr1, %do.cond ], [ %dst, %entry ]
  %s.0 = phi i8* [ %incdec.ptr, %do.cond ], [ %src, %entry ]
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr}, i64 0, metadata !21), !dbg !27
  %0 = load i8* %s.0, align 1, !dbg !27, !tbaa !30
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr1}, i64 0, metadata !18), !dbg !27
  store i8 %0, i8* %d.0, align 1, !dbg !27, !tbaa !30
  %cmp2 = icmp eq i8 %0, 0, !dbg !27
  br i1 %cmp2, label %while.cond.preheader, label %do.cond, !dbg !27

while.cond.preheader:                             ; preds = %do.body
  %cmp517 = icmp eq i64 %n.addr.0, 1, !dbg !33
  br i1 %cmp517, label %if.end11, label %while.body.lr.ph, !dbg !33

while.body.lr.ph:                                 ; preds = %while.cond.preheader
  %1 = add i64 %indvar, 1, !dbg !33
  %scevgep = getelementptr i8* %dst, i64 %1
  %2 = add i64 %n, -1, !dbg !33
  %3 = sub i64 %2, %indvar, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %3, i32 1, i1 false), !dbg !35
  br label %if.end11, !dbg !33

do.cond:                                          ; preds = %do.body
  %incdec.ptr1 = getelementptr inbounds i8* %d.0, i64 1, !dbg !27
  %incdec.ptr = getelementptr inbounds i8* %s.0, i64 1, !dbg !27
  %dec8 = add i64 %n.addr.0, -1, !dbg !36
  tail call void @llvm.dbg.value(metadata !{i64 %dec8}, i64 0, metadata !17), !dbg !36
  %cmp9 = icmp eq i64 %dec8, 0, !dbg !36
  %indvar.next = add i64 %indvar, 1, !dbg !36
  br i1 %cmp9, label %if.end11, label %do.body, !dbg !36

if.end11:                                         ; preds = %do.cond, %while.cond.preheader, %while.body.lr.ph, %entry
  ret i8* %dst, !dbg !37
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strncpy.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/klee-libc/strncpy.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"strncpy", metadata !"strncpy", metadata !"", i32 42, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @strncpy, null, null, metadata !14, i32 43} ; [ DW_TAG_subprogram ] [line 42] [def] [scope 43] [strncpy]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strncpy.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !10, metadata !12}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!9 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!12 = metadata !{i32 786454, metadata !1, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!13 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!14 = metadata !{metadata !15, metadata !16, metadata !17, metadata !18, metadata !21}
!15 = metadata !{i32 786689, metadata !4, metadata !"dst", metadata !5, i32 16777258, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 42]
!16 = metadata !{i32 786689, metadata !4, metadata !"src", metadata !5, i32 33554474, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 42]
!17 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 50331690, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 42]
!18 = metadata !{i32 786688, metadata !19, metadata !"d", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [d] [line 45]
!19 = metadata !{i32 786443, metadata !1, metadata !20, i32 44, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strncpy.c]
!20 = metadata !{i32 786443, metadata !1, metadata !4, i32 44, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strncpy.c]
!21 = metadata !{i32 786688, metadata !19, metadata !"s", metadata !5, i32 46, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 46]
!22 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!23 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!24 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!25 = metadata !{i32 42, i32 0, metadata !4, null}
!26 = metadata !{i32 44, i32 0, metadata !20, null}
!27 = metadata !{i32 49, i32 0, metadata !28, null}
!28 = metadata !{i32 786443, metadata !1, metadata !29, i32 49, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strncpy.c]
!29 = metadata !{i32 786443, metadata !1, metadata !19, i32 48, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strncpy.c]
!30 = metadata !{metadata !31, metadata !31, i64 0}
!31 = metadata !{metadata !"omnipotent char", metadata !32, i64 0}
!32 = metadata !{metadata !"Simple C/C++ TBAA"}
!33 = metadata !{i32 51, i32 0, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !28, i32 49, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strncpy.c]
!35 = metadata !{i32 52, i32 0, metadata !34, null}
!36 = metadata !{i32 55, i32 0, metadata !29, null}
!37 = metadata !{i32 57, i32 0, metadata !4, null}
