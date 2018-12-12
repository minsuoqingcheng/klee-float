; ModuleID = '/home/unix-lc/klee-float/runtime/klee-libc/strtol.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @strtol(i8* %nptr, i8** %endptr, i32 %base) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %nptr}, i64 0, metadata !32), !dbg !46
  tail call void @llvm.dbg.value(metadata !{i8** %endptr}, i64 0, metadata !33), !dbg !46
  tail call void @llvm.dbg.value(metadata !{i32 %base}, i64 0, metadata !34), !dbg !46
  tail call void @llvm.dbg.value(metadata !{i8* %nptr}, i64 0, metadata !35), !dbg !47
  %call = tail call i16** @__ctype_b_loc() #2, !dbg !48
  %0 = load i16** %call, align 8, !dbg !48, !tbaa !49
  br label %do.body, !dbg !53

do.body:                                          ; preds = %do.body, %entry
  %s.0 = phi i8* [ %nptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8* %s.0, i64 1, !dbg !54
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr}, i64 0, metadata !35), !dbg !54
  %1 = load i8* %s.0, align 1, !dbg !54, !tbaa !56
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !38), !dbg !54
  %idxprom = zext i8 %1 to i64, !dbg !57
  %arrayidx = getelementptr inbounds i16* %0, i64 %idxprom, !dbg !48
  %2 = load i16* %arrayidx, align 2, !dbg !48, !tbaa !58
  %and = and i16 %2, 8192, !dbg !48
  %tobool = icmp eq i16 %and, 0, !dbg !48
  br i1 %tobool, label %do.end, label %do.body, !dbg !48

do.end:                                           ; preds = %do.body
  switch i8 %1, label %if.end10 [
    i8 45, label %if.then
    i8 43, label %if.then8
  ], !dbg !60

if.then:                                          ; preds = %do.end
  tail call void @llvm.dbg.value(metadata !62, i64 0, metadata !40), !dbg !63
  %incdec.ptr4 = getelementptr inbounds i8* %s.0, i64 2, !dbg !65
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr4}, i64 0, metadata !35), !dbg !65
  %3 = load i8* %incdec.ptr, align 1, !dbg !65, !tbaa !56
  tail call void @llvm.dbg.value(metadata !{i8 %3}, i64 0, metadata !38), !dbg !65
  br label %if.end10, !dbg !66

if.then8:                                         ; preds = %do.end
  %incdec.ptr9 = getelementptr inbounds i8* %s.0, i64 2, !dbg !67
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr9}, i64 0, metadata !35), !dbg !67
  %4 = load i8* %incdec.ptr, align 1, !dbg !67, !tbaa !56
  tail call void @llvm.dbg.value(metadata !{i8 %4}, i64 0, metadata !38), !dbg !67
  br label %if.end10, !dbg !67

if.end10:                                         ; preds = %do.end, %if.then8, %if.then
  %s.1 = phi i8* [ %incdec.ptr4, %if.then ], [ %incdec.ptr9, %if.then8 ], [ %incdec.ptr, %do.end ]
  %c.0 = phi i8 [ %3, %if.then ], [ %4, %if.then8 ], [ %1, %do.end ]
  %neg.0 = phi i32 [ 1, %if.then ], [ 0, %if.then8 ], [ 0, %do.end ]
  %5 = and i32 %base, -17, !dbg !70
  %6 = icmp eq i32 %5, 0, !dbg !70
  %cmp16 = icmp eq i8 %c.0, 48, !dbg !70
  %or.cond = and i1 %6, %cmp16, !dbg !70
  br i1 %or.cond, label %land.lhs.true18, label %if.end28, !dbg !70

land.lhs.true18:                                  ; preds = %if.end10
  %7 = load i8* %s.1, align 1, !dbg !70, !tbaa !56
  switch i8 %7, label %if.end28 [
    i8 120, label %if.end35.thread
    i8 88, label %if.end35.thread
  ], !dbg !70

if.end35.thread:                                  ; preds = %land.lhs.true18, %land.lhs.true18
  %arrayidx27 = getelementptr inbounds i8* %s.1, i64 1, !dbg !72
  %8 = load i8* %arrayidx27, align 1, !dbg !72, !tbaa !56
  tail call void @llvm.dbg.value(metadata !{i8 %8}, i64 0, metadata !38), !dbg !72
  %add.ptr = getelementptr inbounds i8* %s.1, i64 2, !dbg !74
  tail call void @llvm.dbg.value(metadata !{i8* %add.ptr}, i64 0, metadata !35), !dbg !74
  tail call void @llvm.dbg.value(metadata !75, i64 0, metadata !34), !dbg !76
  tail call void @llvm.dbg.value(metadata !18, i64 0, metadata !41), !dbg !77
  tail call void @llvm.dbg.value(metadata !78, i64 0, metadata !36), !dbg !77
  br label %if.end42, !dbg !79

if.end28:                                         ; preds = %land.lhs.true18, %if.end10
  %cmp29 = icmp eq i32 %base, 0, !dbg !81
  br i1 %cmp29, label %if.then31, label %if.end35, !dbg !81

if.then31:                                        ; preds = %if.end28
  %cond = select i1 %cmp16, i32 8, i32 10, !dbg !83
  tail call void @llvm.dbg.value(metadata !{i32 %cond}, i64 0, metadata !34), !dbg !83
  br label %if.end35, !dbg !83

if.end35:                                         ; preds = %if.then31, %if.end28
  %base.addr.1 = phi i32 [ %cond, %if.then31 ], [ %base, %if.end28 ]
  tail call void @llvm.dbg.value(metadata !18, i64 0, metadata !41), !dbg !77
  tail call void @llvm.dbg.value(metadata !78, i64 0, metadata !36), !dbg !77
  %base.addr.1.off = add i32 %base.addr.1, -2, !dbg !79
  %9 = icmp ugt i32 %base.addr.1.off, 34, !dbg !79
  br i1 %9, label %noconv, label %if.end42, !dbg !79

if.end42:                                         ; preds = %if.end35.thread, %if.end35
  %base.addr.1193 = phi i32 [ 16, %if.end35.thread ], [ %base.addr.1, %if.end35 ]
  %s.2188192 = phi i8* [ %add.ptr, %if.end35.thread ], [ %s.1, %if.end35 ]
  %c.1189191 = phi i8 [ %8, %if.end35.thread ], [ %c.0, %if.end35 ]
  %tobool43 = icmp ne i32 %neg.0, 0, !dbg !84
  %cond44 = select i1 %tobool43, i64 -9223372036854775808, i64 9223372036854775807, !dbg !84
  tail call void @llvm.dbg.value(metadata !{i64 %cond44}, i64 0, metadata !39), !dbg !84
  %conv45 = sext i32 %base.addr.1193 to i64, !dbg !85
  %rem = urem i64 %cond44, %conv45, !dbg !85
  %conv46 = trunc i64 %rem to i32, !dbg !85
  tail call void @llvm.dbg.value(metadata !{i32 %conv46}, i64 0, metadata !42), !dbg !85
  %div = udiv i64 %cond44, %conv45, !dbg !86
  tail call void @llvm.dbg.value(metadata !{i64 %div}, i64 0, metadata !39), !dbg !86
  br label %for.cond, !dbg !87

for.cond:                                         ; preds = %for.inc, %if.end42
  %s.3 = phi i8* [ %s.2188192, %if.end42 ], [ %incdec.ptr108, %for.inc ]
  %acc.0 = phi i64 [ 0, %if.end42 ], [ %acc.1, %for.inc ]
  %c.2 = phi i8 [ %c.1189191, %if.end42 ], [ %13, %for.inc ]
  %any.0 = phi i32 [ 0, %if.end42 ], [ %any.1, %for.inc ]
  %c.2.off = add i8 %c.2, -48, !dbg !89
  %10 = icmp ult i8 %c.2.off, 10, !dbg !89
  br i1 %10, label %if.end85, label %if.else58, !dbg !89

if.else58:                                        ; preds = %for.cond
  %c.2.off194 = add i8 %c.2, -65, !dbg !92
  %11 = icmp ult i8 %c.2.off194, 26, !dbg !92
  br i1 %11, label %if.then66, label %if.else70, !dbg !92

if.then66:                                        ; preds = %if.else58
  %sub68 = add i8 %c.2, -55, !dbg !94
  tail call void @llvm.dbg.value(metadata !{i8 %sub68}, i64 0, metadata !38), !dbg !94
  br label %if.end85, !dbg !94

if.else70:                                        ; preds = %if.else58
  %c.2.off195 = add i8 %c.2, -97, !dbg !95
  %12 = icmp ult i8 %c.2.off195, 26, !dbg !95
  br i1 %12, label %if.then78, label %for.end, !dbg !95

if.then78:                                        ; preds = %if.else70
  %sub80 = add i8 %c.2, -87, !dbg !97
  tail call void @llvm.dbg.value(metadata !{i8 %sub80}, i64 0, metadata !38), !dbg !97
  br label %if.end85

if.end85:                                         ; preds = %for.cond, %if.then66, %if.then78
  %c.3 = phi i8 [ %sub68, %if.then66 ], [ %sub80, %if.then78 ], [ %c.2.off, %for.cond ]
  %conv86 = sext i8 %c.3 to i32, !dbg !98
  %cmp87 = icmp slt i32 %conv86, %base.addr.1193, !dbg !98
  br i1 %cmp87, label %if.end90, label %for.end, !dbg !98

if.end90:                                         ; preds = %if.end85
  %cmp91 = icmp slt i32 %any.0, 0, !dbg !100
  %cmp94 = icmp ugt i64 %acc.0, %div, !dbg !100
  %or.cond185 = or i1 %cmp91, %cmp94, !dbg !100
  br i1 %or.cond185, label %for.inc, label %lor.lhs.false96, !dbg !100

lor.lhs.false96:                                  ; preds = %if.end90
  %cmp97 = icmp eq i64 %acc.0, %div, !dbg !100
  %cmp101 = icmp sgt i32 %conv86, %conv46, !dbg !100
  %or.cond186 = and i1 %cmp97, %cmp101, !dbg !100
  br i1 %or.cond186, label %for.inc, label %if.else104, !dbg !100

if.else104:                                       ; preds = %lor.lhs.false96
  tail call void @llvm.dbg.value(metadata !62, i64 0, metadata !41), !dbg !102
  %mul = mul i64 %acc.0, %conv45, !dbg !104
  tail call void @llvm.dbg.value(metadata !{i64 %mul}, i64 0, metadata !36), !dbg !104
  %conv106 = sext i8 %c.3 to i64, !dbg !105
  %add = add i64 %conv106, %mul, !dbg !105
  tail call void @llvm.dbg.value(metadata !{i64 %add}, i64 0, metadata !36), !dbg !105
  br label %for.inc

for.inc:                                          ; preds = %if.end90, %lor.lhs.false96, %if.else104
  %acc.1 = phi i64 [ %add, %if.else104 ], [ %div, %lor.lhs.false96 ], [ %acc.0, %if.end90 ]
  %any.1 = phi i32 [ 1, %if.else104 ], [ -1, %lor.lhs.false96 ], [ -1, %if.end90 ]
  %incdec.ptr108 = getelementptr inbounds i8* %s.3, i64 1, !dbg !87
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr108}, i64 0, metadata !35), !dbg !87
  %13 = load i8* %s.3, align 1, !dbg !87, !tbaa !56
  tail call void @llvm.dbg.value(metadata !{i8 %13}, i64 0, metadata !38), !dbg !87
  br label %for.cond, !dbg !87

for.end:                                          ; preds = %if.end85, %if.else70
  %cmp109 = icmp slt i32 %any.0, 0, !dbg !106
  br i1 %cmp109, label %if.then111, label %if.else115, !dbg !106

if.then111:                                       ; preds = %for.end
  tail call void @llvm.dbg.value(metadata !{i64 %cond44}, i64 0, metadata !36), !dbg !108
  %call114 = tail call i32* @__errno_location() #2, !dbg !110
  store i32 34, i32* %call114, align 4, !dbg !110, !tbaa !111
  br label %if.end125, !dbg !113

if.else115:                                       ; preds = %for.end
  %tobool116 = icmp eq i32 %any.0, 0, !dbg !114
  br i1 %tobool116, label %noconv, label %if.else119, !dbg !114

noconv:                                           ; preds = %if.else115, %if.end35
  %s.4 = phi i8* [ %s.1, %if.end35 ], [ %s.3, %if.else115 ]
  %acc.2 = phi i64 [ 0, %if.end35 ], [ %acc.0, %if.else115 ]
  %call118 = tail call i32* @__errno_location() #2, !dbg !116
  store i32 22, i32* %call118, align 4, !dbg !116, !tbaa !111
  br label %if.end125, !dbg !118

if.else119:                                       ; preds = %if.else115
  %sub122 = sub i64 0, %acc.0, !dbg !119
  tail call void @llvm.dbg.value(metadata !{i64 %sub122}, i64 0, metadata !36), !dbg !119
  %sub122.acc.0 = select i1 %tobool43, i64 %sub122, i64 %acc.0, !dbg !121
  br label %if.end125, !dbg !121

if.end125:                                        ; preds = %if.else119, %noconv, %if.then111
  %s.5 = phi i8* [ %s.4, %noconv ], [ %s.3, %if.then111 ], [ %s.3, %if.else119 ]
  %acc.3 = phi i64 [ %acc.2, %noconv ], [ %cond44, %if.then111 ], [ %sub122.acc.0, %if.else119 ]
  %any.3 = phi i32 [ 0, %noconv ], [ %any.0, %if.then111 ], [ %any.0, %if.else119 ]
  %cmp126 = icmp eq i8** %endptr, null, !dbg !122
  br i1 %cmp126, label %if.end132, label %if.then128, !dbg !122

if.then128:                                       ; preds = %if.end125
  %tobool129 = icmp eq i32 %any.3, 0, !dbg !124
  %add.ptr130 = getelementptr inbounds i8* %s.5, i64 -1, !dbg !124
  %cond131 = select i1 %tobool129, i8* %nptr, i8* %add.ptr130, !dbg !124
  store i8* %cond131, i8** %endptr, align 8, !dbg !124, !tbaa !49
  br label %if.end132, !dbg !124

if.end132:                                        ; preds = %if.end125, %if.then128
  ret i64 %acc.3, !dbg !125
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #1

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!43, !44}
!llvm.ident = !{!45}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !18, metadata !19, metadata !18, metadata !18, metadata !""} ; [ DW_TAG_compile_unit ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/klee-libc/strtol.c", metadata !"/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !4, null, metadata !"", i32 46, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 46, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !"/usr/include/ctype.h", metadata !"/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc"}
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !17}
!6 = metadata !{i32 786472, metadata !"_ISupper", i64 256} ; [ DW_TAG_enumerator ] [_ISupper :: 256]
!7 = metadata !{i32 786472, metadata !"_ISlower", i64 512} ; [ DW_TAG_enumerator ] [_ISlower :: 512]
!8 = metadata !{i32 786472, metadata !"_ISalpha", i64 1024} ; [ DW_TAG_enumerator ] [_ISalpha :: 1024]
!9 = metadata !{i32 786472, metadata !"_ISdigit", i64 2048} ; [ DW_TAG_enumerator ] [_ISdigit :: 2048]
!10 = metadata !{i32 786472, metadata !"_ISxdigit", i64 4096} ; [ DW_TAG_enumerator ] [_ISxdigit :: 4096]
!11 = metadata !{i32 786472, metadata !"_ISspace", i64 8192} ; [ DW_TAG_enumerator ] [_ISspace :: 8192]
!12 = metadata !{i32 786472, metadata !"_ISprint", i64 16384} ; [ DW_TAG_enumerator ] [_ISprint :: 16384]
!13 = metadata !{i32 786472, metadata !"_ISgraph", i64 32768} ; [ DW_TAG_enumerator ] [_ISgraph :: 32768]
!14 = metadata !{i32 786472, metadata !"_ISblank", i64 1} ; [ DW_TAG_enumerator ] [_ISblank :: 1]
!15 = metadata !{i32 786472, metadata !"_IScntrl", i64 2} ; [ DW_TAG_enumerator ] [_IScntrl :: 2]
!16 = metadata !{i32 786472, metadata !"_ISpunct", i64 4} ; [ DW_TAG_enumerator ] [_ISpunct :: 4]
!17 = metadata !{i32 786472, metadata !"_ISalnum", i64 8} ; [ DW_TAG_enumerator ] [_ISalnum :: 8]
!18 = metadata !{i32 0}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 786478, metadata !1, metadata !21, metadata !"strtol", metadata !"strtol", metadata !"", i32 47, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i8*, i8**, i32)* @strtol, null, null, metadata !31, i32 48} ; [ DW_TAG_subprogram ] [line 47] [def] [scope 48] [strtol]
!21 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!22 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{metadata !24, metadata !25, metadata !28, metadata !30}
!24 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!25 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!26 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!27 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!28 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!29 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!30 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!31 = metadata !{metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !38, metadata !39, metadata !40, metadata !41, metadata !42}
!32 = metadata !{i32 786689, metadata !20, metadata !"nptr", metadata !21, i32 16777263, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nptr] [line 47]
!33 = metadata !{i32 786689, metadata !20, metadata !"endptr", metadata !21, i32 33554479, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [endptr] [line 47]
!34 = metadata !{i32 786689, metadata !20, metadata !"base", metadata !21, i32 50331695, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [base] [line 47]
!35 = metadata !{i32 786688, metadata !20, metadata !"s", metadata !21, i32 49, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 49]
!36 = metadata !{i32 786688, metadata !20, metadata !"acc", metadata !21, i32 50, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [acc] [line 50]
!37 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!38 = metadata !{i32 786688, metadata !20, metadata !"c", metadata !21, i32 51, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 51]
!39 = metadata !{i32 786688, metadata !20, metadata !"cutoff", metadata !21, i32 52, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cutoff] [line 52]
!40 = metadata !{i32 786688, metadata !20, metadata !"neg", metadata !21, i32 53, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [neg] [line 53]
!41 = metadata !{i32 786688, metadata !20, metadata !"any", metadata !21, i32 53, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [any] [line 53]
!42 = metadata !{i32 786688, metadata !20, metadata !"cutlim", metadata !21, i32 53, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cutlim] [line 53]
!43 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!44 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!45 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!46 = metadata !{i32 47, i32 0, metadata !20, null}
!47 = metadata !{i32 60, i32 0, metadata !20, null}
!48 = metadata !{i32 63, i32 0, metadata !20, null}
!49 = metadata !{metadata !50, metadata !50, i64 0}
!50 = metadata !{metadata !"any pointer", metadata !51, i64 0}
!51 = metadata !{metadata !"omnipotent char", metadata !52, i64 0}
!52 = metadata !{metadata !"Simple C/C++ TBAA"}
!53 = metadata !{i32 61, i32 0, metadata !20, null}
!54 = metadata !{i32 62, i32 0, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !20, i32 61, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!56 = metadata !{metadata !51, metadata !51, i64 0}
!57 = metadata !{i32 63, i32 0, metadata !55, null}
!58 = metadata !{metadata !59, metadata !59, i64 0}
!59 = metadata !{metadata !"short", metadata !51, i64 0}
!60 = metadata !{i32 64, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !20, i32 64, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!62 = metadata !{i32 1}
!63 = metadata !{i32 65, i32 0, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !61, i32 64, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!65 = metadata !{i32 66, i32 0, metadata !64, null}
!66 = metadata !{i32 67, i32 0, metadata !64, null}
!67 = metadata !{i32 70, i32 0, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !69, i32 69, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!69 = metadata !{i32 786443, metadata !1, metadata !61, i32 67, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!70 = metadata !{i32 72, i32 0, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !20, i32 72, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!72 = metadata !{i32 74, i32 0, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !71, i32 73, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!74 = metadata !{i32 75, i32 0, metadata !73, null}
!75 = metadata !{i32 16}
!76 = metadata !{i32 76, i32 0, metadata !73, null}
!77 = metadata !{i32 80, i32 0, metadata !20, null}
!78 = metadata !{i64 0}
!79 = metadata !{i32 81, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !20, i32 81, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!81 = metadata !{i32 78, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !20, i32 78, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!83 = metadata !{i32 79, i32 0, metadata !82, null}
!84 = metadata !{i32 101, i32 0, metadata !20, null}
!85 = metadata !{i32 103, i32 0, metadata !20, null}
!86 = metadata !{i32 104, i32 0, metadata !20, null}
!87 = metadata !{i32 105, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !20, i32 105, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!89 = metadata !{i32 106, i32 0, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !91, i32 106, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!91 = metadata !{i32 786443, metadata !1, metadata !88, i32 105, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!92 = metadata !{i32 108, i32 0, metadata !93, null}
!93 = metadata !{i32 786443, metadata !1, metadata !90, i32 108, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!94 = metadata !{i32 109, i32 0, metadata !93, null}
!95 = metadata !{i32 110, i32 0, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !93, i32 110, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!97 = metadata !{i32 111, i32 0, metadata !96, null}
!98 = metadata !{i32 114, i32 0, metadata !99, null}
!99 = metadata !{i32 786443, metadata !1, metadata !91, i32 114, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!100 = metadata !{i32 116, i32 0, metadata !101, null}
!101 = metadata !{i32 786443, metadata !1, metadata !91, i32 116, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!102 = metadata !{i32 119, i32 0, metadata !103, null}
!103 = metadata !{i32 786443, metadata !1, metadata !101, i32 118, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!104 = metadata !{i32 120, i32 0, metadata !103, null}
!105 = metadata !{i32 121, i32 0, metadata !103, null}
!106 = metadata !{i32 124, i32 0, metadata !107, null}
!107 = metadata !{i32 786443, metadata !1, metadata !20, i32 124, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!108 = metadata !{i32 125, i32 0, metadata !109, null}
!109 = metadata !{i32 786443, metadata !1, metadata !107, i32 124, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!110 = metadata !{i32 126, i32 0, metadata !109, null}
!111 = metadata !{metadata !112, metadata !112, i64 0}
!112 = metadata !{metadata !"int", metadata !51, i64 0}
!113 = metadata !{i32 127, i32 0, metadata !109, null}
!114 = metadata !{i32 127, i32 0, metadata !115, null}
!115 = metadata !{i32 786443, metadata !1, metadata !107, i32 127, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!116 = metadata !{i32 129, i32 0, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !115, i32 127, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!118 = metadata !{i32 130, i32 0, metadata !117, null}
!119 = metadata !{i32 131, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !115, i32 130, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!121 = metadata !{i32 130, i32 0, metadata !120, null}
!122 = metadata !{i32 132, i32 0, metadata !123, null}
!123 = metadata !{i32 786443, metadata !1, metadata !20, i32 132, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/klee_build_dir/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/strtol.c]
!124 = metadata !{i32 133, i32 0, metadata !123, null}
!125 = metadata !{i32 134, i32 0, metadata !20, null}
