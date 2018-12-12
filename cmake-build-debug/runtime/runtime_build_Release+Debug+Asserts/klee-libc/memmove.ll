; ModuleID = '/home/unix-lc/klee-float/runtime/klee-libc/memmove.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i8* @memmove(i8* %dst, i8* readonly %src, i64 %count) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %dst}, i64 0, metadata !14), !dbg !26
  tail call void @llvm.dbg.value(metadata !{i8* %src}, i64 0, metadata !15), !dbg !26
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !16), !dbg !26
  tail call void @llvm.dbg.value(metadata !{i8* %dst}, i64 0, metadata !17), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i8* %src}, i64 0, metadata !20), !dbg !28
  %cmp = icmp eq i8* %src, %dst, !dbg !29
  br i1 %cmp, label %return, label %if.end, !dbg !29

if.end:                                           ; preds = %entry
  %cmp1 = icmp ugt i8* %src, %dst, !dbg !31
  br i1 %cmp1, label %while.cond.preheader, label %if.else, !dbg !31

while.cond.preheader:                             ; preds = %if.end
  tail call void @llvm.dbg.value(metadata !{i64 %dec}, i64 0, metadata !16), !dbg !33
  %tobool27 = icmp eq i64 %count, 0, !dbg !33
  br i1 %tobool27, label %return, label %while.body.preheader, !dbg !33

while.body.preheader:                             ; preds = %while.cond.preheader
  %n.vec = and i64 %count, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %0 = add i64 %count, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %while.body.preheader
  %scevgep37 = getelementptr i8* %src, i64 %0
  %scevgep = getelementptr i8* %dst, i64 %0
  %bound1 = icmp uge i8* %scevgep, %src
  %bound0 = icmp uge i8* %scevgep37, %dst
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %src, i64 %n.vec
  %ptr.ind.end39 = getelementptr i8* %dst, i64 %n.vec
  %rev.ind.end = sub i64 %count, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %src, i64 %index
  %next.gep136 = getelementptr i8* %dst, i64 %index
  %1 = bitcast i8* %next.gep to <16 x i8>*, !dbg !33
  %wide.load = load <16 x i8>* %1, align 1, !dbg !33
  %next.gep.sum610 = or i64 %index, 16, !dbg !33
  %2 = getelementptr i8* %src, i64 %next.gep.sum610, !dbg !33
  %3 = bitcast i8* %2 to <16 x i8>*, !dbg !33
  %wide.load233 = load <16 x i8>* %3, align 1, !dbg !33
  %4 = bitcast i8* %next.gep136 to <16 x i8>*, !dbg !33
  store <16 x i8> %wide.load, <16 x i8>* %4, align 1, !dbg !33
  %next.gep136.sum627 = or i64 %index, 16, !dbg !33
  %5 = getelementptr i8* %dst, i64 %next.gep136.sum627, !dbg !33
  %6 = bitcast i8* %5 to <16 x i8>*, !dbg !33
  store <16 x i8> %wide.load233, <16 x i8>* %6, align 1, !dbg !33
  %index.next = add i64 %index, 32
  %7 = icmp eq i64 %index.next, %n.vec
  br i1 %7, label %middle.block, label %vector.body, !llvm.loop !35

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %while.body.preheader
  %resume.val = phi i8* [ %src, %while.body.preheader ], [ %src, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val38 = phi i8* [ %dst, %while.body.preheader ], [ %dst, %vector.memcheck ], [ %ptr.ind.end39, %vector.body ]
  %resume.val40 = phi i64 [ %count, %while.body.preheader ], [ %count, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %while.body.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %return, label %while.body

while.body:                                       ; preds = %middle.block, %while.body
  %b.030 = phi i8* [ %incdec.ptr, %while.body ], [ %resume.val, %middle.block ]
  %a.029 = phi i8* [ %incdec.ptr3, %while.body ], [ %resume.val38, %middle.block ]
  %count.addr.028 = phi i64 [ %dec, %while.body ], [ %resume.val40, %middle.block ]
  %dec = add i64 %count.addr.028, -1, !dbg !33
  %incdec.ptr = getelementptr inbounds i8* %b.030, i64 1, !dbg !33
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr}, i64 0, metadata !20), !dbg !33
  %8 = load i8* %b.030, align 1, !dbg !33, !tbaa !38
  %incdec.ptr3 = getelementptr inbounds i8* %a.029, i64 1, !dbg !33
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3}, i64 0, metadata !17), !dbg !33
  store i8 %8, i8* %a.029, align 1, !dbg !33, !tbaa !38
  tail call void @llvm.dbg.value(metadata !{i64 %dec}, i64 0, metadata !16), !dbg !33
  %tobool = icmp eq i64 %dec, 0, !dbg !33
  br i1 %tobool, label %return, label %while.body, !dbg !33, !llvm.loop !41

if.else:                                          ; preds = %if.end
  %sub = add i64 %count, -1, !dbg !42
  tail call void @llvm.dbg.value(metadata !{i8* %add.ptr}, i64 0, metadata !17), !dbg !42
  tail call void @llvm.dbg.value(metadata !{i8* %add.ptr5}, i64 0, metadata !20), !dbg !44
  tail call void @llvm.dbg.value(metadata !{i64 %dec7}, i64 0, metadata !16), !dbg !45
  %tobool832 = icmp eq i64 %count, 0, !dbg !45
  br i1 %tobool832, label %return, label %while.body9.lr.ph, !dbg !45

while.body9.lr.ph:                                ; preds = %if.else
  %add.ptr5 = getelementptr inbounds i8* %src, i64 %sub, !dbg !44
  %add.ptr = getelementptr inbounds i8* %dst, i64 %sub, !dbg !42
  %n.vec241 = and i64 %count, -32
  %cmp.zero243 = icmp eq i64 %n.vec241, 0
  %9 = add i64 %count, -1
  br i1 %cmp.zero243, label %middle.block236, label %vector.memcheck250

vector.memcheck250:                               ; preds = %while.body9.lr.ph
  %scevgep245 = getelementptr i8* %src, i64 %9
  %scevgep244 = getelementptr i8* %dst, i64 %9
  %bound1247 = icmp ule i8* %scevgep245, %dst
  %bound0246 = icmp ule i8* %scevgep244, %src
  %memcheck.conflict249 = and i1 %bound0246, %bound1247
  %add.ptr5.sum = sub i64 %sub, %n.vec241
  %rev.ptr.ind.end = getelementptr i8* %src, i64 %add.ptr5.sum
  %add.ptr.sum = sub i64 %sub, %n.vec241
  %rev.ptr.ind.end255 = getelementptr i8* %dst, i64 %add.ptr.sum
  %rev.ind.end257 = sub i64 %count, %n.vec241
  br i1 %memcheck.conflict249, label %middle.block236, label %vector.body235

vector.body235:                                   ; preds = %vector.memcheck250, %vector.body235
  %index238 = phi i64 [ %index.next260, %vector.body235 ], [ 0, %vector.memcheck250 ]
  %add.ptr5.sum465 = sub i64 %sub, %index238
  %add.ptr.sum497 = sub i64 %sub, %index238
  %next.gep262.sum = add i64 %add.ptr5.sum465, -15, !dbg !45
  %10 = getelementptr i8* %src, i64 %next.gep262.sum, !dbg !45
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !45
  %wide.load460 = load <16 x i8>* %11, align 1, !dbg !45
  %reverse = shufflevector <16 x i8> %wide.load460, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !45
  %.sum = add i64 %add.ptr5.sum465, -31, !dbg !45
  %12 = getelementptr i8* %src, i64 %.sum, !dbg !45
  %13 = bitcast i8* %12 to <16 x i8>*, !dbg !45
  %wide.load461 = load <16 x i8>* %13, align 1, !dbg !45
  %reverse462 = shufflevector <16 x i8> %wide.load461, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !45
  %reverse463 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !45
  %next.gep359.sum = add i64 %add.ptr.sum497, -15, !dbg !45
  %14 = getelementptr i8* %dst, i64 %next.gep359.sum, !dbg !45
  %15 = bitcast i8* %14 to <16 x i8>*, !dbg !45
  store <16 x i8> %reverse463, <16 x i8>* %15, align 1, !dbg !45
  %reverse464 = shufflevector <16 x i8> %reverse462, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !45
  %.sum531 = add i64 %add.ptr.sum497, -31, !dbg !45
  %16 = getelementptr i8* %dst, i64 %.sum531, !dbg !45
  %17 = bitcast i8* %16 to <16 x i8>*, !dbg !45
  store <16 x i8> %reverse464, <16 x i8>* %17, align 1, !dbg !45
  %index.next260 = add i64 %index238, 32
  %18 = icmp eq i64 %index.next260, %n.vec241
  br i1 %18, label %middle.block236, label %vector.body235, !llvm.loop !46

middle.block236:                                  ; preds = %vector.body235, %vector.memcheck250, %while.body9.lr.ph
  %resume.val251 = phi i8* [ %add.ptr5, %while.body9.lr.ph ], [ %add.ptr5, %vector.memcheck250 ], [ %rev.ptr.ind.end, %vector.body235 ]
  %resume.val253 = phi i8* [ %add.ptr, %while.body9.lr.ph ], [ %add.ptr, %vector.memcheck250 ], [ %rev.ptr.ind.end255, %vector.body235 ]
  %resume.val256 = phi i64 [ %count, %while.body9.lr.ph ], [ %count, %vector.memcheck250 ], [ %rev.ind.end257, %vector.body235 ]
  %new.indc.resume.val258 = phi i64 [ 0, %while.body9.lr.ph ], [ 0, %vector.memcheck250 ], [ %n.vec241, %vector.body235 ]
  %cmp.n259 = icmp eq i64 %new.indc.resume.val258, %count
  br i1 %cmp.n259, label %return, label %while.body9

while.body9:                                      ; preds = %middle.block236, %while.body9
  %b.135 = phi i8* [ %incdec.ptr10, %while.body9 ], [ %resume.val251, %middle.block236 ]
  %a.134 = phi i8* [ %incdec.ptr11, %while.body9 ], [ %resume.val253, %middle.block236 ]
  %count.addr.133 = phi i64 [ %dec7, %while.body9 ], [ %resume.val256, %middle.block236 ]
  %dec7 = add i64 %count.addr.133, -1, !dbg !45
  %incdec.ptr10 = getelementptr inbounds i8* %b.135, i64 -1, !dbg !45
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr10}, i64 0, metadata !20), !dbg !45
  %19 = load i8* %b.135, align 1, !dbg !45, !tbaa !38
  %incdec.ptr11 = getelementptr inbounds i8* %a.134, i64 -1, !dbg !45
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr11}, i64 0, metadata !17), !dbg !45
  store i8 %19, i8* %a.134, align 1, !dbg !45, !tbaa !38
  tail call void @llvm.dbg.value(metadata !{i64 %dec7}, i64 0, metadata !16), !dbg !45
  %tobool8 = icmp eq i64 %dec7, 0, !dbg !45
  br i1 %tobool8, label %return, label %while.body9, !dbg !45, !llvm.loop !47

return:                                           ; preds = %while.body9, %middle.block236, %while.body, %middle.block, %if.else, %while.cond.preheader, %entry
  ret i8* %dst, !dbg !48
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/memmove.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/klee-libc/memmove.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !13, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [memmove]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/memmove.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9, metadata !11}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{i32 786454, metadata !1, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!12 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!13 = metadata !{metadata !14, metadata !15, metadata !16, metadata !17, metadata !20}
!14 = metadata !{i32 786689, metadata !4, metadata !"dst", metadata !5, i32 16777228, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!15 = metadata !{i32 786689, metadata !4, metadata !"src", metadata !5, i32 33554444, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!16 = metadata !{i32 786689, metadata !4, metadata !"count", metadata !5, i32 50331660, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!17 = metadata !{i32 786688, metadata !4, metadata !"a", metadata !5, i32 13, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!19 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = metadata !{i32 786688, metadata !4, metadata !"b", metadata !5, i32 14, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!23 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!24 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!25 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!26 = metadata !{i32 12, i32 0, metadata !4, null}
!27 = metadata !{i32 13, i32 0, metadata !4, null}
!28 = metadata !{i32 14, i32 0, metadata !4, null}
!29 = metadata !{i32 16, i32 0, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/memmove.c]
!31 = metadata !{i32 19, i32 0, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !4, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/memmove.c]
!33 = metadata !{i32 20, i32 0, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !32, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/memmove.c]
!35 = metadata !{metadata !35, metadata !36, metadata !37}
!36 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!37 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!38 = metadata !{metadata !39, metadata !39, i64 0}
!39 = metadata !{metadata !"omnipotent char", metadata !40, i64 0}
!40 = metadata !{metadata !"Simple C/C++ TBAA"}
!41 = metadata !{metadata !41, metadata !36, metadata !37}
!42 = metadata !{i32 22, i32 0, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !32, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/memmove.c]
!44 = metadata !{i32 23, i32 0, metadata !43, null}
!45 = metadata !{i32 24, i32 0, metadata !43, null}
!46 = metadata !{metadata !46, metadata !36, metadata !37}
!47 = metadata !{metadata !47, metadata !36, metadata !37}
!48 = metadata !{i32 28, i32 0, metadata !4, null}
