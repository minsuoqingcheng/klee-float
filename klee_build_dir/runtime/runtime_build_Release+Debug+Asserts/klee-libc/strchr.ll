; ModuleID = '/home/unix-lc/klee-float/runtime/klee-libc/strchr.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i8* @strchr(i8* readonly %p, i32 %ch) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %p}, i64 0, metadata !14), !dbg !20
  tail call void @llvm.dbg.value(metadata !{i32 %ch}, i64 0, metadata !15), !dbg !20
  %0 = load i8* %p, align 1, !dbg !21, !tbaa !25
  %conv111 = sext i8 %0 to i32, !dbg !21
  %sext = shl i32 %ch, 24, !dbg !21
  %conv2 = ashr exact i32 %sext, 24, !dbg !21
  %cmp12 = icmp eq i32 %conv111, %conv2, !dbg !21
  br i1 %cmp12, label %return, label %if.else, !dbg !21

for.cond:                                         ; preds = %if.else
  %1 = load i8* %incdec.ptr, align 1, !dbg !21, !tbaa !25
  %conv1 = sext i8 %1 to i32, !dbg !21
  %cmp = icmp eq i32 %conv1, %conv2, !dbg !21
  br i1 %cmp, label %return, label %if.else, !dbg !21

if.else:                                          ; preds = %entry, %for.cond
  %2 = phi i8 [ %1, %for.cond ], [ %0, %entry ]
  %p.addr.013 = phi i8* [ %incdec.ptr, %for.cond ], [ %p, %entry ]
  %cmp5 = icmp eq i8 %2, 0, !dbg !28
  %incdec.ptr = getelementptr inbounds i8* %p.addr.013, i64 1, !dbg !30
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr}, i64 0, metadata !14), !dbg !30
  br i1 %cmp5, label %return, label %for.cond, !dbg !28

return:                                           ; preds = %for.cond, %if.else, %entry
  %retval.0 = phi i8* [ %p, %entry ], [ %incdec.ptr, %for.cond ], [ null, %if.else ]
  ret i8* %retval.0, !dbg !31
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strchr.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/klee-libc/strchr.c", metadata !"/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"strchr", metadata !"strchr", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32)* @strchr, null, null, metadata !13, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [strchr]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strchr.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !10, metadata !12}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!9 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{metadata !14, metadata !15, metadata !16}
!14 = metadata !{i32 786689, metadata !4, metadata !"p", metadata !5, i32 16777226, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 10]
!15 = metadata !{i32 786689, metadata !4, metadata !"ch", metadata !5, i32 33554442, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ch] [line 10]
!16 = metadata !{i32 786688, metadata !4, metadata !"c", metadata !5, i32 11, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 11]
!17 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!18 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!19 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!20 = metadata !{i32 10, i32 0, metadata !4, null}
!21 = metadata !{i32 15, i32 0, metadata !22, null}
!22 = metadata !{i32 786443, metadata !1, metadata !23, i32 15, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strchr.c]
!23 = metadata !{i32 786443, metadata !1, metadata !24, i32 14, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strchr.c]
!24 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strchr.c]
!25 = metadata !{metadata !26, metadata !26, i64 0}
!26 = metadata !{metadata !"omnipotent char", metadata !27, i64 0}
!27 = metadata !{metadata !"Simple C/C++ TBAA"}
!28 = metadata !{i32 17, i32 0, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !22, i32 17, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strchr.c]
!30 = metadata !{i32 14, i32 0, metadata !24, null}
!31 = metadata !{i32 23, i32 0, metadata !4, null}
