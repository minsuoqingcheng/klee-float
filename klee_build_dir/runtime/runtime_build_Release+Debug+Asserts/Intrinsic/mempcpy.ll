; ModuleID = '/home/unix-lc/klee-float/runtime/Intrinsic/mempcpy.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %destaddr}, i64 0, metadata !14), !dbg !26
  tail call void @llvm.dbg.value(metadata !{i8* %srcaddr}, i64 0, metadata !15), !dbg !26
  tail call void @llvm.dbg.value(metadata !{i64 %len}, i64 0, metadata !16), !dbg !26
  tail call void @llvm.dbg.value(metadata !{i8* %destaddr}, i64 0, metadata !17), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i8* %srcaddr}, i64 0, metadata !20), !dbg !28
  tail call void @llvm.dbg.value(metadata !{i64 %dec}, i64 0, metadata !16), !dbg !29
  %cmp3 = icmp eq i64 %len, 0, !dbg !29
  br i1 %cmp3, label %while.end, label %while.body.preheader, !dbg !29

while.body.preheader:                             ; preds = %entry
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %0 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %while.body.preheader
  %scevgep8 = getelementptr i8* %srcaddr, i64 %0
  %scevgep7 = getelementptr i8* %destaddr, i64 %0
  %bound1 = icmp uge i8* %scevgep7, %srcaddr
  %bound0 = icmp uge i8* %scevgep8, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end10 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep107 = getelementptr i8* %destaddr, i64 %index
  %1 = bitcast i8* %next.gep to <16 x i8>*, !dbg !30
  %wide.load = load <16 x i8>* %1, align 1, !dbg !30
  %next.gep.sum283 = or i64 %index, 16, !dbg !30
  %2 = getelementptr i8* %srcaddr, i64 %next.gep.sum283, !dbg !30
  %3 = bitcast i8* %2 to <16 x i8>*, !dbg !30
  %wide.load204 = load <16 x i8>* %3, align 1, !dbg !30
  %4 = bitcast i8* %next.gep107 to <16 x i8>*, !dbg !30
  store <16 x i8> %wide.load, <16 x i8>* %4, align 1, !dbg !30
  %next.gep107.sum300 = or i64 %index, 16, !dbg !30
  %5 = getelementptr i8* %destaddr, i64 %next.gep107.sum300, !dbg !30
  %6 = bitcast i8* %5 to <16 x i8>*, !dbg !30
  store <16 x i8> %wide.load204, <16 x i8>* %6, align 1, !dbg !30
  %index.next = add i64 %index, 32
  %7 = icmp eq i64 %index.next, %n.vec
  br i1 %7, label %middle.block, label %vector.body, !llvm.loop !31

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %while.body.preheader
  %resume.val = phi i8* [ %srcaddr, %while.body.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val9 = phi i8* [ %destaddr, %while.body.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end10, %vector.body ]
  %resume.val11 = phi i64 [ %len, %while.body.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %while.body.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %while.cond.while.end_crit_edge, label %while.body

while.body:                                       ; preds = %middle.block, %while.body
  %src.06 = phi i8* [ %incdec.ptr, %while.body ], [ %resume.val, %middle.block ]
  %dest.05 = phi i8* [ %incdec.ptr1, %while.body ], [ %resume.val9, %middle.block ]
  %len.addr.04 = phi i64 [ %dec, %while.body ], [ %resume.val11, %middle.block ]
  %dec = add i64 %len.addr.04, -1, !dbg !29
  %incdec.ptr = getelementptr inbounds i8* %src.06, i64 1, !dbg !30
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr}, i64 0, metadata !20), !dbg !30
  %8 = load i8* %src.06, align 1, !dbg !30, !tbaa !34
  %incdec.ptr1 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !30
  tail call void @llvm.dbg.value(metadata !{i8* %scevgep}, i64 0, metadata !17), !dbg !30
  store i8 %8, i8* %dest.05, align 1, !dbg !30, !tbaa !34
  tail call void @llvm.dbg.value(metadata !{i64 %dec}, i64 0, metadata !16), !dbg !29
  %cmp = icmp eq i64 %dec, 0, !dbg !29
  br i1 %cmp, label %while.cond.while.end_crit_edge, label %while.body, !dbg !29, !llvm.loop !37

while.cond.while.end_crit_edge:                   ; preds = %middle.block, %while.body
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %while.end, !dbg !29

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %dest.0.lcssa = phi i8* [ %scevgep, %while.cond.while.end_crit_edge ], [ %destaddr, %entry ]
  ret i8* %dest.0.lcssa, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/unix-lc/klee-float/klee_build_dir/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/mempcpy.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/mempcpy.c", metadata !"/home/unix-lc/klee-float/klee_build_dir/runtime/Intrinsic"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !13, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [mempcpy]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/klee_build_dir/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/mempcpy.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9, metadata !11}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{i32 786454, metadata !1, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!12 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!13 = metadata !{metadata !14, metadata !15, metadata !16, metadata !17, metadata !20}
!14 = metadata !{i32 786689, metadata !4, metadata !"destaddr", metadata !5, i32 16777227, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!15 = metadata !{i32 786689, metadata !4, metadata !"srcaddr", metadata !5, i32 33554443, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!16 = metadata !{i32 786689, metadata !4, metadata !"len", metadata !5, i32 50331659, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!17 = metadata !{i32 786688, metadata !4, metadata !"dest", metadata !5, i32 12, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!19 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = metadata !{i32 786688, metadata !4, metadata !"src", metadata !5, i32 13, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!23 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!24 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!25 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!26 = metadata !{i32 11, i32 0, metadata !4, null}
!27 = metadata !{i32 12, i32 0, metadata !4, null}
!28 = metadata !{i32 13, i32 0, metadata !4, null}
!29 = metadata !{i32 15, i32 0, metadata !4, null}
!30 = metadata !{i32 16, i32 0, metadata !4, null}
!31 = metadata !{metadata !31, metadata !32, metadata !33}
!32 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!33 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!34 = metadata !{metadata !35, metadata !35, i64 0}
!35 = metadata !{metadata !"omnipotent char", metadata !36, i64 0}
!36 = metadata !{metadata !"Simple C/C++ TBAA"}
!37 = metadata !{metadata !37, metadata !32, metadata !33}
!38 = metadata !{i32 17, i32 0, metadata !4, null}
