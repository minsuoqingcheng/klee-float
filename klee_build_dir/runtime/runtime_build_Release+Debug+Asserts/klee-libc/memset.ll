; ModuleID = '/home/unix-lc/klee-float/runtime/klee-libc/memset.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i8* @memset(i8* %dst, i32 %s, i64 %count) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %dst}, i64 0, metadata !13), !dbg !22
  tail call void @llvm.dbg.value(metadata !{i32 %s}, i64 0, metadata !14), !dbg !22
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !15), !dbg !22
  tail call void @llvm.dbg.value(metadata !{i8* %dst}, i64 0, metadata !16), !dbg !23
  tail call void @llvm.dbg.value(metadata !{i64 %dec}, i64 0, metadata !15), !dbg !24
  %cmp2 = icmp eq i64 %count, 0, !dbg !24
  br i1 %cmp2, label %while.end, label %while.body.lr.ph, !dbg !24

while.body.lr.ph:                                 ; preds = %entry
  %conv = trunc i32 %s to i8, !dbg !25
  %n.vec = and i64 %count, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ptr.ind.end = getelementptr i8* %dst, i64 %n.vec
  %rev.ind.end = sub i64 %count, %n.vec
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %while.body.lr.ph
  %broadcast.splatinsert101 = insertelement <16 x i8> undef, i8 %conv, i32 0
  %broadcast.splat102 = shufflevector <16 x i8> %broadcast.splatinsert101, <16 x i8> undef, <16 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %next.gep = getelementptr i8* %dst, i64 %index
  %0 = bitcast i8* %next.gep to <16 x i8>*, !dbg !25
  store <16 x i8> %broadcast.splat102, <16 x i8>* %0, align 1, !dbg !25
  %next.gep.sum150 = or i64 %index, 16, !dbg !25
  %1 = getelementptr i8* %dst, i64 %next.gep.sum150, !dbg !25
  %2 = bitcast i8* %1 to <16 x i8>*, !dbg !25
  store <16 x i8> %broadcast.splat102, <16 x i8>* %2, align 1, !dbg !25
  %index.next = add i64 %index, 32
  %3 = icmp eq i64 %index.next, %n.vec
  br i1 %3, label %middle.block, label %vector.body, !llvm.loop !26

middle.block:                                     ; preds = %vector.body, %while.body.lr.ph
  %resume.val = phi i8* [ %dst, %while.body.lr.ph ], [ %ptr.ind.end, %vector.body ]
  %resume.val5 = phi i64 [ %count, %while.body.lr.ph ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %while.body.lr.ph ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %while.end, label %while.body

while.body:                                       ; preds = %middle.block, %while.body
  %a.04 = phi i8* [ %incdec.ptr, %while.body ], [ %resume.val, %middle.block ]
  %count.addr.03 = phi i64 [ %dec, %while.body ], [ %resume.val5, %middle.block ]
  %dec = add i64 %count.addr.03, -1, !dbg !24
  %incdec.ptr = getelementptr inbounds i8* %a.04, i64 1, !dbg !25
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr}, i64 0, metadata !16), !dbg !25
  store i8 %conv, i8* %a.04, align 1, !dbg !25, !tbaa !29
  tail call void @llvm.dbg.value(metadata !{i64 %dec}, i64 0, metadata !15), !dbg !24
  %cmp = icmp eq i64 %dec, 0, !dbg !24
  br i1 %cmp, label %while.end, label %while.body, !dbg !24, !llvm.loop !32

while.end:                                        ; preds = %while.body, %middle.block, %entry
  ret i8* %dst, !dbg !33
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/memset.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/klee-libc/memset.c", metadata !"/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"memset", metadata !"memset", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !12, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [memset]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/memset.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9, metadata !10}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786454, metadata !1, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!11 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16}
!13 = metadata !{i32 786689, metadata !4, metadata !"dst", metadata !5, i32 16777228, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!14 = metadata !{i32 786689, metadata !4, metadata !"s", metadata !5, i32 33554444, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!15 = metadata !{i32 786689, metadata !4, metadata !"count", metadata !5, i32 50331660, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!16 = metadata !{i32 786688, metadata !4, metadata !"a", metadata !5, i32 13, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!18 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!20 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!21 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!22 = metadata !{i32 12, i32 0, metadata !4, null}
!23 = metadata !{i32 13, i32 0, metadata !4, null}
!24 = metadata !{i32 14, i32 0, metadata !4, null}
!25 = metadata !{i32 15, i32 0, metadata !4, null}
!26 = metadata !{metadata !26, metadata !27, metadata !28}
!27 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!28 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!29 = metadata !{metadata !30, metadata !30, i64 0}
!30 = metadata !{metadata !"omnipotent char", metadata !31, i64 0}
!31 = metadata !{metadata !"Simple C/C++ TBAA"}
!32 = metadata !{metadata !32, metadata !27, metadata !28}
!33 = metadata !{i32 16, i32 0, metadata !4, null}
