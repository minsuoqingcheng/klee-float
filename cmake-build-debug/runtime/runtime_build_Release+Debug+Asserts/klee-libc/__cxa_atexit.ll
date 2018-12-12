; ModuleID = '/home/unix-lc/klee-float/runtime/klee-libc/__cxa_atexit.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { void (i8*)*, i8*, i8* }

@NumAtExit = internal unnamed_addr global i32 0, align 4
@AtExit = internal unnamed_addr global [128 x %struct.anon] zeroinitializer, align 16
@.str = private unnamed_addr constant [34 x i8] c"FIXME: __cxa_atexit being ignored\00", align 1
@.str1 = private unnamed_addr constant [58 x i8] c"/home/unix-lc/klee-float/runtime/klee-libc/__cxa_atexit.c\00", align 1
@.str2 = private unnamed_addr constant [32 x i8] c"__cxa_atexit: no room in array!\00", align 1
@.str3 = private unnamed_addr constant [5 x i8] c"exec\00", align 1
@llvm.global_dtors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 65535, void ()* @RunAtExit }]

; Function Attrs: nounwind uwtable
define internal void @RunAtExit() #0 {
entry:
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !9), !dbg !37
  %0 = load i32* @NumAtExit, align 4, !dbg !37, !tbaa !39
  %cmp6 = icmp eq i32 %0, 0, !dbg !37
  br i1 %cmp6, label %for.end, label %for.body, !dbg !37

for.body:                                         ; preds = %entry, %for.body
  %i.07 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %idxprom = zext i32 %i.07 to i64, !dbg !43
  %fn = getelementptr inbounds [128 x %struct.anon]* @AtExit, i64 0, i64 %idxprom, i32 0, !dbg !43
  %1 = load void (i8*)** %fn, align 8, !dbg !43, !tbaa !44
  %arg = getelementptr inbounds [128 x %struct.anon]* @AtExit, i64 0, i64 %idxprom, i32 1, !dbg !43
  %2 = load i8** %arg, align 8, !dbg !43, !tbaa !47
  tail call void %1(i8* %2) #4, !dbg !43
  %inc = add i32 %i.07, 1, !dbg !37
  tail call void @llvm.dbg.value(metadata !{i32 %inc}, i64 0, metadata !9), !dbg !37
  %3 = load i32* @NumAtExit, align 4, !dbg !37, !tbaa !39
  %cmp = icmp ult i32 %inc, %3, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.end:                                          ; preds = %for.body, %entry
  ret void, !dbg !48
}

; Function Attrs: nounwind uwtable
define i32 @__cxa_atexit(void (i8*)* %fn, i8* %arg, i8* nocapture readnone %dso_handle) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{void (i8*)* %fn}, i64 0, metadata !20), !dbg !49
  tail call void @llvm.dbg.value(metadata !{i8* %arg}, i64 0, metadata !21), !dbg !50
  tail call void @llvm.dbg.value(metadata !{i8* %dso_handle}, i64 0, metadata !22), !dbg !51
  tail call void @klee_warning_once(i8* getelementptr inbounds ([34 x i8]* @.str, i64 0, i64 0)) #4, !dbg !52
  %0 = load i32* @NumAtExit, align 4, !dbg !53, !tbaa !39
  %cmp = icmp eq i32 %0, 128, !dbg !53
  br i1 %cmp, label %if.then, label %if.end, !dbg !53

if.then:                                          ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([58 x i8]* @.str1, i64 0, i64 0), i32 39, i8* getelementptr inbounds ([32 x i8]* @.str2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str3, i64 0, i64 0)) #5, !dbg !55
  unreachable, !dbg !55

if.end:                                           ; preds = %entry
  %idxprom = zext i32 %0 to i64, !dbg !56
  %fn1 = getelementptr inbounds [128 x %struct.anon]* @AtExit, i64 0, i64 %idxprom, i32 0, !dbg !56
  store void (i8*)* %fn, void (i8*)** %fn1, align 8, !dbg !56, !tbaa !44
  %arg4 = getelementptr inbounds [128 x %struct.anon]* @AtExit, i64 0, i64 %idxprom, i32 1, !dbg !57
  store i8* %arg, i8** %arg4, align 8, !dbg !57, !tbaa !47
  %inc = add i32 %0, 1, !dbg !58
  store i32 %inc, i32* @NumAtExit, align 4, !dbg !58, !tbaa !39
  ret i32 0, !dbg !59
}

declare void @klee_warning_once(i8*) #1

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!34, !35}
!llvm.ident = !{!36}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !23, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/__cxa_atexit.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/klee-libc/__cxa_atexit.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !11}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"RunAtExit", metadata !"RunAtExit", metadata !"", i32 22, metadata !6, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ()* @RunAtExit, null, null, metadata !8, i32 22} ; [ DW_TAG_subprogram ] [line 22] [local] [def] [RunAtExit]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/__cxa_atexit.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{metadata !9}
!9 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 23, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 23]
!10 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__cxa_atexit", metadata !"__cxa_atexit", metadata !"", i32 29, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (void (i8*)*, i8*, i8*)* @__cxa_atexit, null, null, metadata !19, i32 31} ; [ DW_TAG_subprogram ] [line 29] [def] [scope 31] [__cxa_atexit]
!12 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = metadata !{metadata !14, metadata !15, metadata !18, metadata !18}
!14 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{null, metadata !18}
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!19 = metadata !{metadata !20, metadata !21, metadata !22}
!20 = metadata !{i32 786689, metadata !11, metadata !"fn", metadata !5, i32 16777245, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fn] [line 29]
!21 = metadata !{i32 786689, metadata !11, metadata !"arg", metadata !5, i32 33554462, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arg] [line 30]
!22 = metadata !{i32 786689, metadata !11, metadata !"dso_handle", metadata !5, i32 50331679, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dso_handle] [line 31]
!23 = metadata !{metadata !24, metadata !33}
!24 = metadata !{i32 786484, i32 0, null, metadata !"AtExit", metadata !"AtExit", metadata !"", metadata !5, i32 18, metadata !25, i32 1, i32 1, [128 x %struct.anon]* @AtExit, null} ; [ DW_TAG_variable ] [AtExit] [line 18] [local] [def]
!25 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 24576, i64 64, i32 0, i32 0, metadata !26, metadata !31, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 24576, align 64, offset 0] [from ]
!26 = metadata !{i32 786451, metadata !1, null, metadata !"", i32 14, i64 192, i64 64, i32 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 14, size 192, align 64, offset 0] [def] [from ]
!27 = metadata !{metadata !28, metadata !29, metadata !30}
!28 = metadata !{i32 786445, metadata !1, metadata !26, metadata !"fn", i32 15, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [fn] [line 15, size 64, align 64, offset 0] [from ]
!29 = metadata !{i32 786445, metadata !1, metadata !26, metadata !"arg", i32 16, i64 64, i64 64, i64 64, i32 0, metadata !18} ; [ DW_TAG_member ] [arg] [line 16, size 64, align 64, offset 64] [from ]
!30 = metadata !{i32 786445, metadata !1, metadata !26, metadata !"dso_handle", i32 17, i64 64, i64 64, i64 128, i32 0, metadata !18} ; [ DW_TAG_member ] [dso_handle] [line 17, size 64, align 64, offset 128] [from ]
!31 = metadata !{metadata !32}
!32 = metadata !{i32 786465, i64 0, i64 128}      ; [ DW_TAG_subrange_type ] [0, 127]
!33 = metadata !{i32 786484, i32 0, null, metadata !"NumAtExit", metadata !"NumAtExit", metadata !"", metadata !5, i32 19, metadata !10, i32 1, i32 1, i32* @NumAtExit, null} ; [ DW_TAG_variable ] [NumAtExit] [line 19] [local] [def]
!34 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!35 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!36 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!37 = metadata !{i32 25, i32 0, metadata !38, null}
!38 = metadata !{i32 786443, metadata !1, metadata !4, i32 25, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/__cxa_atexit.c]
!39 = metadata !{metadata !40, metadata !40, i64 0}
!40 = metadata !{metadata !"int", metadata !41, i64 0}
!41 = metadata !{metadata !"omnipotent char", metadata !42, i64 0}
!42 = metadata !{metadata !"Simple C/C++ TBAA"}
!43 = metadata !{i32 26, i32 0, metadata !38, null}
!44 = metadata !{metadata !45, metadata !46, i64 0}
!45 = metadata !{metadata !"", metadata !46, i64 0, metadata !46, i64 8, metadata !46, i64 16}
!46 = metadata !{metadata !"any pointer", metadata !41, i64 0}
!47 = metadata !{metadata !45, metadata !46, i64 8}
!48 = metadata !{i32 27, i32 0, metadata !4, null}
!49 = metadata !{i32 29, i32 0, metadata !11, null}
!50 = metadata !{i32 30, i32 0, metadata !11, null}
!51 = metadata !{i32 31, i32 0, metadata !11, null}
!52 = metadata !{i32 32, i32 0, metadata !11, null}
!53 = metadata !{i32 37, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !11, i32 37, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/klee-libc//home/unix-lc/klee-float/runtime/klee-libc/__cxa_atexit.c]
!55 = metadata !{i32 38, i32 0, metadata !54, null}
!56 = metadata !{i32 43, i32 0, metadata !11, null}
!57 = metadata !{i32 44, i32 0, metadata !11, null}
!58 = metadata !{i32 45, i32 0, metadata !11, null}
!59 = metadata !{i32 47, i32 0, metadata !11, null}
