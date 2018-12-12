; ModuleID = '/home/unix-lc/klee-float/runtime/klee-libc/strcpy.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i8* @strcpy(i8* %to, i8* nocapture readonly %from) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %to}, i64 0, metadata !13), !dbg !19
  tail call void @llvm.dbg.value(metadata !{i8* %from}, i64 0, metadata !14), !dbg !19
  tail call void @llvm.dbg.value(metadata !{i8* %to}, i64 0, metadata !15), !dbg !20
  %0 = load i8* %from, align 1, !dbg !21, !tbaa !22
  store i8 %0, i8* %to, align 1, !dbg !21, !tbaa !22
  %tobool5 = icmp eq i8 %0, 0, !dbg !21
  br i1 %tobool5, label %while.end, label %while.body, !dbg !21

while.body:                                       ; preds = %entry, %while.body
  %to.addr.07 = phi i8* [ %incdec.ptr, %while.body ], [ %to, %entry ]
  %from.addr.06 = phi i8* [ %incdec.ptr1, %while.body ], [ %from, %entry ]
  %incdec.ptr = getelementptr inbounds i8* %to.addr.07, i64 1, !dbg !25
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr}, i64 0, metadata !13), !dbg !25
  %incdec.ptr1 = getelementptr inbounds i8* %from.addr.06, i64 1, !dbg !25
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr1}, i64 0, metadata !14), !dbg !25
  %1 = load i8* %incdec.ptr1, align 1, !dbg !21, !tbaa !22
  store i8 %1, i8* %incdec.ptr, align 1, !dbg !21, !tbaa !22
  %tobool = icmp eq i8 %1, 0, !dbg !21
  br i1 %tobool, label %while.end, label %while.body, !dbg !21

while.end:                                        ; preds = %while.body, %entry
  ret i8* %to, !dbg !26
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strcpy.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/klee-libc/strcpy.c", metadata !"/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"strcpy", metadata !"strcpy", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*)* @strcpy, null, null, metadata !12, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [strcpy]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strcpy.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !10}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!9 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!12 = metadata !{metadata !13, metadata !14, metadata !15}
!13 = metadata !{i32 786689, metadata !4, metadata !"to", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [to] [line 10]
!14 = metadata !{i32 786689, metadata !4, metadata !"from", metadata !5, i32 33554442, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [from] [line 10]
!15 = metadata !{i32 786688, metadata !4, metadata !"start", metadata !5, i32 11, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [start] [line 11]
!16 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!17 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!18 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!19 = metadata !{i32 10, i32 0, metadata !4, null}
!20 = metadata !{i32 11, i32 0, metadata !4, null}
!21 = metadata !{i32 13, i32 0, metadata !4, null}
!22 = metadata !{metadata !23, metadata !23, i64 0}
!23 = metadata !{metadata !"omnipotent char", metadata !24, i64 0}
!24 = metadata !{metadata !"Simple C/C++ TBAA"}
!25 = metadata !{i32 14, i32 0, metadata !4, null}
!26 = metadata !{i32 16, i32 0, metadata !4, null}
