; ModuleID = '/home/unix-lc/klee-float/runtime/klee-libc/strncmp.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i32 @strncmp(i8* nocapture readonly %s1, i8* nocapture readonly %s2, i64 %n) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %s1}, i64 0, metadata !15), !dbg !21
  tail call void @llvm.dbg.value(metadata !{i8* %s2}, i64 0, metadata !16), !dbg !21
  tail call void @llvm.dbg.value(metadata !{i64 %n}, i64 0, metadata !17), !dbg !21
  %cmp = icmp eq i64 %n, 0, !dbg !22
  br i1 %cmp, label %return, label %do.body, !dbg !22

do.body:                                          ; preds = %entry, %do.cond
  %s1.addr.0 = phi i8* [ %incdec.ptr8, %do.cond ], [ %s1, %entry ]
  %s2.addr.0 = phi i8* [ %incdec.ptr, %do.cond ], [ %s2, %entry ]
  %n.addr.0 = phi i64 [ %dec, %do.cond ], [ %n, %entry ]
  %0 = load i8* %s1.addr.0, align 1, !dbg !24, !tbaa !27
  %incdec.ptr = getelementptr inbounds i8* %s2.addr.0, i64 1, !dbg !24
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr}, i64 0, metadata !16), !dbg !24
  %1 = load i8* %s2.addr.0, align 1, !dbg !24, !tbaa !27
  %cmp2 = icmp eq i8 %0, %1, !dbg !24
  br i1 %cmp2, label %if.end7, label %if.then4, !dbg !24

if.then4:                                         ; preds = %do.body
  %conv5 = zext i8 %0 to i32, !dbg !30
  %conv6 = zext i8 %1 to i32, !dbg !30
  %sub = sub nsw i32 %conv5, %conv6, !dbg !30
  br label %return, !dbg !30

if.end7:                                          ; preds = %do.body
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr8}, i64 0, metadata !15), !dbg !31
  %cmp10 = icmp eq i8 %0, 0, !dbg !31
  br i1 %cmp10, label %return, label %do.cond, !dbg !31

do.cond:                                          ; preds = %if.end7
  %incdec.ptr8 = getelementptr inbounds i8* %s1.addr.0, i64 1, !dbg !31
  %dec = add i64 %n.addr.0, -1, !dbg !33
  tail call void @llvm.dbg.value(metadata !{i64 %dec}, i64 0, metadata !17), !dbg !33
  %cmp14 = icmp eq i64 %dec, 0, !dbg !33
  br i1 %cmp14, label %return, label %do.body, !dbg !33

return:                                           ; preds = %if.end7, %do.cond, %entry, %if.then4
  %retval.0 = phi i32 [ %sub, %if.then4 ], [ 0, %entry ], [ 0, %do.cond ], [ 0, %if.end7 ]
  ret i32 %retval.0, !dbg !34
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!18, !19}
!llvm.ident = !{!20}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strncmp.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/klee-libc/strncmp.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"strncmp", metadata !"strncmp", metadata !"", i32 36, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64)* @strncmp, null, null, metadata !14, i32 37} ; [ DW_TAG_subprogram ] [line 36] [def] [scope 37] [strncmp]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strncmp.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !9, metadata !12}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 786454, metadata !1, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!13 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!14 = metadata !{metadata !15, metadata !16, metadata !17}
!15 = metadata !{i32 786689, metadata !4, metadata !"s1", metadata !5, i32 16777252, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s1] [line 36]
!16 = metadata !{i32 786689, metadata !4, metadata !"s2", metadata !5, i32 33554468, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s2] [line 36]
!17 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 50331684, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 36]
!18 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!19 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!20 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!21 = metadata !{i32 36, i32 0, metadata !4, null}
!22 = metadata !{i32 39, i32 0, metadata !23, null}
!23 = metadata !{i32 786443, metadata !1, metadata !4, i32 39, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strncmp.c]
!24 = metadata !{i32 42, i32 0, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !26, i32 42, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strncmp.c]
!26 = metadata !{i32 786443, metadata !1, metadata !4, i32 41, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strncmp.c]
!27 = metadata !{metadata !28, metadata !28, i64 0}
!28 = metadata !{metadata !"omnipotent char", metadata !29, i64 0}
!29 = metadata !{metadata !"Simple C/C++ TBAA"}
!30 = metadata !{i32 43, i32 0, metadata !25, null}
!31 = metadata !{i32 45, i32 0, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !26, i32 45, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strncmp.c]
!33 = metadata !{i32 47, i32 0, metadata !26, null}
!34 = metadata !{i32 49, i32 0, metadata !4, null}
