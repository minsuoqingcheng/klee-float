; ModuleID = 'get_sign.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"res\00", align 1
@switch.table = private unnamed_addr constant [5 x i32] [i32 0, i32 3073, i32 2048, i32 1024, i32 3072]
@.str2 = private unnamed_addr constant [65 x i8] c"/home/unix-lc/klee-float/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str13 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str24 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private unnamed_addr constant [56 x i8] c"/home/unix-lc/klee-float/runtime/Intrinsic/klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1
@.str9 = private unnamed_addr constant [68 x i8] c"/home/unix-lc/klee-float/runtime/Intrinsic/klee_set_rounding_mode.c\00", align 1
@.str110 = private unnamed_addr constant [22 x i8] c"Invalid rounding mode\00", align 1
@.str211 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind uwtable
define double @get_sign(double %x) #0 {
entry:
  %retval = alloca double, align 8
  %x.addr = alloca double, align 8
  store double %x, double* %x.addr, align 8
  %0 = load double* %x.addr, align 8, !dbg !243
  %cmp = fcmp oeq double %0, 0.000000e+00, !dbg !243
  br i1 %cmp, label %if.then, label %if.end, !dbg !243

if.then:                                          ; preds = %entry
  store double 0.000000e+00, double* %retval, !dbg !245
  br label %return, !dbg !245

if.end:                                           ; preds = %entry
  %1 = load double* %x.addr, align 8, !dbg !246
  %cmp1 = fcmp olt double %1, 1.500000e+00, !dbg !246
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !246

if.then2:                                         ; preds = %if.end
  store double -1.000000e+00, double* %retval, !dbg !248
  br label %return, !dbg !248

if.else:                                          ; preds = %if.end
  store double 1.000000e+00, double* %retval, !dbg !249
  br label %return, !dbg !249

return:                                           ; preds = %if.else, %if.then2, %if.then
  %2 = load double* %retval, !dbg !250
  ret double %2, !dbg !250
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define double @klee_output(i8* %name, double %v) #0 {
entry:
  %name.addr = alloca i8*, align 8
  %v.addr = alloca double, align 8
  store i8* %name, i8** %name.addr, align 8
  store double %v, double* %v.addr, align 8
  %0 = load double* %v.addr, align 8, !dbg !251
  ret double %0, !dbg !251
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca double, align 8
  %res = alloca double, align 8
  store i32 0, i32* %retval
  %0 = bitcast double* %a to i8*, !dbg !252
  call void @klee_make_symbolic(i8* %0, i64 8, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !252
  %1 = load double* %a, align 8, !dbg !253
  %call = call double @get_sign(double %1), !dbg !253
  store double %call, double* %res, align 8, !dbg !253
  %2 = load double* %res, align 8, !dbg !254
  %call1 = call double @klee_output(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), double %2), !dbg !254
  ret i32 0, !dbg !255
}

declare void @klee_make_symbolic(i8*, i64, i8*) #2

declare zeroext i1 @klee_is_infinite_float(float) #3

declare zeroext i1 @klee_is_infinite_double(double) #3

declare zeroext i1 @klee_is_infinite_long_double(x86_fp80) #3

; Function Attrs: noinline nounwind optnone uwtable
define i32 @klee_internal_isinff(float %f) #4 {
entry:
  %isinf = tail call zeroext i1 @klee_is_infinite_float(float %f) #8
  %cmp = fcmp ogt float %f, 0.000000e+00
  %posOrNeg = select i1 %cmp, i32 1, i32 -1
  %result = select i1 %isinf, i32 %posOrNeg, i32 0
  ret i32 %result
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @klee_internal_isinf(double %d) #4 {
entry:
  %isinf = tail call zeroext i1 @klee_is_infinite_double(double %d) #8
  %cmp = fcmp ogt double %d, 0.000000e+00
  %posOrNeg = select i1 %cmp, i32 1, i32 -1
  %result = select i1 %isinf, i32 %posOrNeg, i32 0
  ret i32 %result
}

; Function Attrs: noinline optnone
define i32 @klee_internal_isinfl(x86_fp80 %d) #5 {
entry:
  %isinf = tail call zeroext i1 @klee_is_infinite_long_double(x86_fp80 %d) #8
  %cmp = fcmp ogt x86_fp80 %d, 0xK00000000000000000000
  %posOrNeg = select i1 %cmp, i32 1, i32 -1
  %result = select i1 %isinf, i32 %posOrNeg, i32 0
  ret i32 %result
}

; Function Attrs: nounwind uwtable
define double @klee_internal_fabs(double %d) #6 {
entry:
  %call = tail call double @klee_abs_double(double %d) #8, !dbg !256
  ret double %call, !dbg !256
}

declare double @klee_abs_double(double) #3

; Function Attrs: nounwind uwtable
define float @klee_internal_fabsf(float %f) #6 {
entry:
  %call = tail call float @klee_abs_float(float %f) #8, !dbg !257
  ret float %call, !dbg !257
}

declare float @klee_abs_float(float) #3

; Function Attrs: nounwind uwtable
define x86_fp80 @klee_internal_fabsl(x86_fp80 %f) #6 {
entry:
  %call = tail call x86_fp80 @klee_abs_long_double(x86_fp80 %f) #8, !dbg !258
  ret x86_fp80 %call, !dbg !258
}

declare x86_fp80 @klee_abs_long_double(x86_fp80) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @klee_internal_fegetround() #6 {
entry:
  %call = tail call i32 (...)* @klee_get_rounding_mode() #8, !dbg !259
  %0 = icmp ult i32 %call, 5, !dbg !260
  br i1 %0, label %switch.lookup, label %return, !dbg !260

switch.lookup:                                    ; preds = %entry
  %1 = sext i32 %call to i64, !dbg !260
  %switch.gep = getelementptr inbounds [5 x i32]* @switch.table, i64 0, i64 %1, !dbg !260
  %switch.load = load i32* %switch.gep, align 4, !dbg !260
  ret i32 %switch.load, !dbg !260

return:                                           ; preds = %entry
  ret i32 -1, !dbg !261
}

declare i32 @klee_get_rounding_mode(...) #3

; Function Attrs: nounwind uwtable
define i32 @klee_internal_fesetround(i32 %rm) #6 {
entry:
  switch i32 %rm, label %return [
    i32 0, label %sw.bb
    i32 2048, label %sw.bb1
    i32 1024, label %sw.bb2
    i32 3072, label %sw.bb3
  ], !dbg !262

sw.bb:                                            ; preds = %entry
  tail call void @klee_set_rounding_mode(i32 0) #8, !dbg !263
  br label %return, !dbg !265

sw.bb1:                                           ; preds = %entry
  tail call void @klee_set_rounding_mode(i32 2) #8, !dbg !266
  br label %return, !dbg !267

sw.bb2:                                           ; preds = %entry
  tail call void @klee_set_rounding_mode(i32 3) #8, !dbg !268
  br label %return, !dbg !269

sw.bb3:                                           ; preds = %entry
  tail call void @klee_set_rounding_mode(i32 4) #8, !dbg !270
  br label %return, !dbg !271

return:                                           ; preds = %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb, %entry
  %retval.0 = phi i32 [ -1, %entry ], [ 0, %sw.bb3 ], [ 0, %sw.bb2 ], [ 0, %sw.bb1 ], [ 0, %sw.bb ]
  ret i32 %retval.0, !dbg !272
}

; Function Attrs: nounwind uwtable
define i32 @klee_internal_isnanf(float %f) #6 {
entry:
  %call = tail call zeroext i1 @klee_is_nan_float(float %f) #8, !dbg !273
  %conv = zext i1 %call to i32, !dbg !273
  ret i32 %conv, !dbg !273
}

declare zeroext i1 @klee_is_nan_float(float) #3

; Function Attrs: nounwind uwtable
define i32 @klee_internal_isnan(double %d) #6 {
entry:
  %call = tail call zeroext i1 @klee_is_nan_double(double %d) #8, !dbg !274
  %conv = zext i1 %call to i32, !dbg !274
  ret i32 %conv, !dbg !274
}

declare zeroext i1 @klee_is_nan_double(double) #3

; Function Attrs: nounwind uwtable
define i32 @klee_internal_isnanl(x86_fp80 %d) #6 {
entry:
  %call = tail call zeroext i1 @klee_is_nan_long_double(x86_fp80 %d) #8, !dbg !275
  %conv = zext i1 %call to i32, !dbg !275
  ret i32 %conv, !dbg !275
}

declare zeroext i1 @klee_is_nan_long_double(x86_fp80) #3

; Function Attrs: nounwind uwtable
define i32 @klee_internal_fpclassifyf(float %f) #6 {
entry:
  %call = tail call zeroext i1 @klee_is_nan_float(float %f) #8, !dbg !276
  br i1 %call, label %return, label %if.else, !dbg !276

if.else:                                          ; preds = %entry
  %call1 = tail call zeroext i1 @klee_is_infinite_float(float %f) #8, !dbg !278
  br i1 %call1, label %return, label %if.else3, !dbg !278

if.else3:                                         ; preds = %if.else
  %cmp = fcmp oeq float %f, 0.000000e+00, !dbg !280
  br i1 %cmp, label %return, label %if.else5, !dbg !280

if.else5:                                         ; preds = %if.else3
  %call6 = tail call zeroext i1 @klee_is_normal_float(float %f) #8, !dbg !282
  %. = select i1 %call6, i32 4, i32 3, !dbg !284
  br label %return, !dbg !284

return:                                           ; preds = %if.else5, %if.else3, %if.else, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ 1, %if.else ], [ 2, %if.else3 ], [ %., %if.else5 ]
  ret i32 %retval.0, !dbg !286
}

declare zeroext i1 @klee_is_normal_float(float) #3

; Function Attrs: nounwind uwtable
define i32 @klee_internal_fpclassify(double %f) #6 {
entry:
  %call = tail call zeroext i1 @klee_is_nan_double(double %f) #8, !dbg !287
  br i1 %call, label %return, label %if.else, !dbg !287

if.else:                                          ; preds = %entry
  %call1 = tail call zeroext i1 @klee_is_infinite_double(double %f) #8, !dbg !289
  br i1 %call1, label %return, label %if.else3, !dbg !289

if.else3:                                         ; preds = %if.else
  %cmp = fcmp oeq double %f, 0.000000e+00, !dbg !291
  br i1 %cmp, label %return, label %if.else5, !dbg !291

if.else5:                                         ; preds = %if.else3
  %call6 = tail call zeroext i1 @klee_is_normal_double(double %f) #8, !dbg !293
  %. = select i1 %call6, i32 4, i32 3, !dbg !295
  br label %return, !dbg !295

return:                                           ; preds = %if.else5, %if.else3, %if.else, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ 1, %if.else ], [ 2, %if.else3 ], [ %., %if.else5 ]
  ret i32 %retval.0, !dbg !297
}

declare zeroext i1 @klee_is_normal_double(double) #3

; Function Attrs: nounwind uwtable
define i32 @klee_internal_fpclassifyl(x86_fp80 %ld) #6 {
entry:
  %call = tail call zeroext i1 @klee_is_nan_long_double(x86_fp80 %ld) #8, !dbg !298
  br i1 %call, label %return, label %if.else, !dbg !298

if.else:                                          ; preds = %entry
  %call1 = tail call zeroext i1 @klee_is_infinite_long_double(x86_fp80 %ld) #8, !dbg !300
  br i1 %call1, label %return, label %if.else3, !dbg !300

if.else3:                                         ; preds = %if.else
  %cmp = fcmp oeq x86_fp80 %ld, 0xK00000000000000000000, !dbg !302
  br i1 %cmp, label %return, label %if.else5, !dbg !302

if.else5:                                         ; preds = %if.else3
  %call6 = tail call zeroext i1 @klee_is_normal_long_double(x86_fp80 %ld) #8, !dbg !304
  %. = select i1 %call6, i32 4, i32 3, !dbg !306
  br label %return, !dbg !306

return:                                           ; preds = %if.else5, %if.else3, %if.else, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ 1, %if.else ], [ 2, %if.else3 ], [ %., %if.else5 ]
  ret i32 %retval.0, !dbg !308
}

declare zeroext i1 @klee_is_normal_long_double(x86_fp80) #3

; Function Attrs: nounwind uwtable
define i32 @klee_internal_finitef(float %f) #6 {
entry:
  %call = tail call zeroext i1 @klee_is_nan_float(float %f) #8, !dbg !309
  %0 = zext i1 %call to i32, !dbg !309
  %lnot.ext = xor i32 %0, 1, !dbg !309
  %call1 = tail call zeroext i1 @klee_is_infinite_float(float %f) #8, !dbg !309
  %1 = zext i1 %call1 to i32, !dbg !309
  %lnot.ext3 = xor i32 %1, 1, !dbg !309
  %and = and i32 %lnot.ext3, %lnot.ext, !dbg !309
  ret i32 %and, !dbg !309
}

; Function Attrs: nounwind uwtable
define i32 @klee_internal_finite(double %f) #6 {
entry:
  %call = tail call zeroext i1 @klee_is_nan_double(double %f) #8, !dbg !310
  %0 = zext i1 %call to i32, !dbg !310
  %lnot.ext = xor i32 %0, 1, !dbg !310
  %call1 = tail call zeroext i1 @klee_is_infinite_double(double %f) #8, !dbg !310
  %1 = zext i1 %call1 to i32, !dbg !310
  %lnot.ext3 = xor i32 %1, 1, !dbg !310
  %and = and i32 %lnot.ext3, %lnot.ext, !dbg !310
  ret i32 %and, !dbg !310
}

; Function Attrs: nounwind uwtable
define i32 @klee_internal_finitel(x86_fp80 %f) #6 {
entry:
  %call = tail call zeroext i1 @klee_is_nan_long_double(x86_fp80 %f) #8, !dbg !311
  %0 = zext i1 %call to i32, !dbg !311
  %lnot.ext = xor i32 %0, 1, !dbg !311
  %call1 = tail call zeroext i1 @klee_is_infinite_long_double(x86_fp80 %f) #8, !dbg !311
  %1 = zext i1 %call1 to i32, !dbg !311
  %lnot.ext3 = xor i32 %1, 1, !dbg !311
  %and = and i32 %lnot.ext3, %lnot.ext, !dbg !311
  ret i32 %and, !dbg !311
}

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #6 {
entry:
  %cmp = icmp eq i64 %z, 0, !dbg !312
  br i1 %cmp, label %if.then, label %if.end, !dbg !312

if.then:                                          ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([65 x i8]* @.str2, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str13, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str24, i64 0, i64 0)) #9, !dbg !314
  unreachable, !dbg !314

if.end:                                           ; preds = %entry
  ret void, !dbg !315
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #7

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #6 {
entry:
  %x = alloca i32, align 4
  %0 = bitcast i32* %x to i8*, !dbg !316
  call void @klee_make_symbolic(i8* %0, i64 4, i8* %name) #8, !dbg !316
  %1 = load i32* %x, align 4, !dbg !317, !tbaa !318
  ret i32 %1, !dbg !317
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #6 {
entry:
  %cmp = icmp ult i64 %shift, %bitWidth, !dbg !322
  br i1 %cmp, label %if.end, label %if.then, !dbg !322

if.then:                                          ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str3, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #9, !dbg !324
  unreachable, !dbg !324

if.end:                                           ; preds = %entry
  ret void, !dbg !326
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #6 {
entry:
  %x = alloca i32, align 4
  %cmp = icmp slt i32 %start, %end, !dbg !327
  br i1 %cmp, label %if.end, label %if.then, !dbg !327

if.then:                                          ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([56 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #9, !dbg !329
  unreachable, !dbg !329

if.end:                                           ; preds = %entry
  %add = add nsw i32 %start, 1, !dbg !330
  %cmp1 = icmp eq i32 %add, %end, !dbg !330
  br i1 %cmp1, label %return, label %if.else, !dbg !330

if.else:                                          ; preds = %if.end
  %0 = bitcast i32* %x to i8*, !dbg !332
  call void @klee_make_symbolic(i8* %0, i64 4, i8* %name) #8, !dbg !332
  %cmp3 = icmp eq i32 %start, 0, !dbg !334
  %1 = load i32* %x, align 4, !dbg !336, !tbaa !318
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !334

if.then4:                                         ; preds = %if.else
  %cmp5 = icmp ult i32 %1, %end, !dbg !336
  %conv6 = zext i1 %cmp5 to i64, !dbg !336
  call void @klee_assume(i64 %conv6) #8, !dbg !336
  br label %if.end14, !dbg !338

if.else7:                                         ; preds = %if.else
  %cmp8 = icmp sge i32 %1, %start, !dbg !339
  %conv10 = zext i1 %cmp8 to i64, !dbg !339
  call void @klee_assume(i64 %conv10) #8, !dbg !339
  %2 = load i32* %x, align 4, !dbg !341, !tbaa !318
  %cmp11 = icmp slt i32 %2, %end, !dbg !341
  %conv13 = zext i1 %cmp11 to i64, !dbg !341
  call void @klee_assume(i64 %conv13) #8, !dbg !341
  br label %if.end14

if.end14:                                         ; preds = %if.else7, %if.then4
  %3 = load i32* %x, align 4, !dbg !342, !tbaa !318
  br label %return, !dbg !342

return:                                           ; preds = %if.end14, %if.end
  %retval.0 = phi i32 [ %3, %if.end14 ], [ %start, %if.end ]
  ret i32 %retval.0, !dbg !343
}

declare void @klee_assume(i64) #3

; Function Attrs: nounwind uwtable
define void @klee_set_rounding_mode(i32 %rm) #6 {
entry:
  switch i32 %rm, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb2
    i32 3, label %sw.bb3
    i32 4, label %sw.bb4
  ], !dbg !344

sw.bb:                                            ; preds = %entry
  tail call void @klee_set_rounding_mode_internal(i32 0) #8, !dbg !345
  br label %sw.epilog, !dbg !345

sw.bb1:                                           ; preds = %entry
  tail call void @klee_set_rounding_mode_internal(i32 1) #8, !dbg !347
  br label %sw.epilog, !dbg !347

sw.bb2:                                           ; preds = %entry
  tail call void @klee_set_rounding_mode_internal(i32 2) #8, !dbg !348
  br label %sw.epilog, !dbg !348

sw.bb3:                                           ; preds = %entry
  tail call void @klee_set_rounding_mode_internal(i32 3) #8, !dbg !349
  br label %sw.epilog, !dbg !349

sw.bb4:                                           ; preds = %entry
  tail call void @klee_set_rounding_mode_internal(i32 4) #8, !dbg !350
  br label %sw.epilog, !dbg !350

sw.default:                                       ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([68 x i8]* @.str9, i64 0, i64 0), i32 31, i8* getelementptr inbounds ([22 x i8]* @.str110, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str211, i64 0, i64 0)) #9, !dbg !351
  unreachable, !dbg !351

sw.epilog:                                        ; preds = %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  ret void, !dbg !352
}

declare void @klee_set_rounding_mode_internal(i32) #3

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #6 {
entry:
  %cmp3 = icmp eq i64 %len, 0, !dbg !353
  br i1 %cmp3, label %while.end, label %while.body.preheader, !dbg !353

while.body.preheader:                             ; preds = %entry
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %0 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %while.body.preheader
  %scevgep7 = getelementptr i8* %srcaddr, i64 %0
  %scevgep = getelementptr i8* %destaddr, i64 %0
  %bound1 = icmp uge i8* %scevgep, %srcaddr
  %bound0 = icmp uge i8* %scevgep7, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end9 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep106 = getelementptr i8* %destaddr, i64 %index
  %1 = bitcast i8* %next.gep to <16 x i8>*, !dbg !354
  %wide.load = load <16 x i8>* %1, align 1, !dbg !354
  %next.gep.sum282 = or i64 %index, 16, !dbg !354
  %2 = getelementptr i8* %srcaddr, i64 %next.gep.sum282, !dbg !354
  %3 = bitcast i8* %2 to <16 x i8>*, !dbg !354
  %wide.load203 = load <16 x i8>* %3, align 1, !dbg !354
  %4 = bitcast i8* %next.gep106 to <16 x i8>*, !dbg !354
  store <16 x i8> %wide.load, <16 x i8>* %4, align 1, !dbg !354
  %next.gep106.sum299 = or i64 %index, 16, !dbg !354
  %5 = getelementptr i8* %destaddr, i64 %next.gep106.sum299, !dbg !354
  %6 = bitcast i8* %5 to <16 x i8>*, !dbg !354
  store <16 x i8> %wide.load203, <16 x i8>* %6, align 1, !dbg !354
  %index.next = add i64 %index, 32
  %7 = icmp eq i64 %index.next, %n.vec
  br i1 %7, label %middle.block, label %vector.body, !llvm.loop !355

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %while.body.preheader
  %resume.val = phi i8* [ %srcaddr, %while.body.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val8 = phi i8* [ %destaddr, %while.body.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end9, %vector.body ]
  %resume.val10 = phi i64 [ %len, %while.body.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %while.body.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %while.end, label %while.body

while.body:                                       ; preds = %while.body, %middle.block
  %src.06 = phi i8* [ %incdec.ptr, %while.body ], [ %resume.val, %middle.block ]
  %dest.05 = phi i8* [ %incdec.ptr1, %while.body ], [ %resume.val8, %middle.block ]
  %len.addr.04 = phi i64 [ %dec, %while.body ], [ %resume.val10, %middle.block ]
  %dec = add i64 %len.addr.04, -1, !dbg !353
  %incdec.ptr = getelementptr inbounds i8* %src.06, i64 1, !dbg !354
  %8 = load i8* %src.06, align 1, !dbg !354, !tbaa !358
  %incdec.ptr1 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !354
  store i8 %8, i8* %dest.05, align 1, !dbg !354, !tbaa !358
  %cmp = icmp eq i64 %dec, 0, !dbg !353
  br i1 %cmp, label %while.end, label %while.body, !dbg !353, !llvm.loop !359

while.end:                                        ; preds = %while.body, %middle.block, %entry
  ret i8* %destaddr, !dbg !360
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #6 {
entry:
  %cmp = icmp eq i8* %src, %dst, !dbg !361
  br i1 %cmp, label %return, label %if.end, !dbg !361

if.end:                                           ; preds = %entry
  %cmp1 = icmp ugt i8* %src, %dst, !dbg !363
  br i1 %cmp1, label %while.cond.preheader, label %if.else, !dbg !363

while.cond.preheader:                             ; preds = %if.end
  %tobool27 = icmp eq i64 %count, 0, !dbg !365
  br i1 %tobool27, label %return, label %while.body.preheader, !dbg !365

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

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %src, i64 %index
  %next.gep136 = getelementptr i8* %dst, i64 %index
  %1 = bitcast i8* %next.gep to <16 x i8>*, !dbg !365
  %wide.load = load <16 x i8>* %1, align 1, !dbg !365
  %next.gep.sum610 = or i64 %index, 16, !dbg !365
  %2 = getelementptr i8* %src, i64 %next.gep.sum610, !dbg !365
  %3 = bitcast i8* %2 to <16 x i8>*, !dbg !365
  %wide.load233 = load <16 x i8>* %3, align 1, !dbg !365
  %4 = bitcast i8* %next.gep136 to <16 x i8>*, !dbg !365
  store <16 x i8> %wide.load, <16 x i8>* %4, align 1, !dbg !365
  %next.gep136.sum627 = or i64 %index, 16, !dbg !365
  %5 = getelementptr i8* %dst, i64 %next.gep136.sum627, !dbg !365
  %6 = bitcast i8* %5 to <16 x i8>*, !dbg !365
  store <16 x i8> %wide.load233, <16 x i8>* %6, align 1, !dbg !365
  %index.next = add i64 %index, 32
  %7 = icmp eq i64 %index.next, %n.vec
  br i1 %7, label %middle.block, label %vector.body, !llvm.loop !367

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %while.body.preheader
  %resume.val = phi i8* [ %src, %while.body.preheader ], [ %src, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val38 = phi i8* [ %dst, %while.body.preheader ], [ %dst, %vector.memcheck ], [ %ptr.ind.end39, %vector.body ]
  %resume.val40 = phi i64 [ %count, %while.body.preheader ], [ %count, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %while.body.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %return, label %while.body

while.body:                                       ; preds = %while.body, %middle.block
  %b.030 = phi i8* [ %incdec.ptr, %while.body ], [ %resume.val, %middle.block ]
  %a.029 = phi i8* [ %incdec.ptr3, %while.body ], [ %resume.val38, %middle.block ]
  %count.addr.028 = phi i64 [ %dec, %while.body ], [ %resume.val40, %middle.block ]
  %dec = add i64 %count.addr.028, -1, !dbg !365
  %incdec.ptr = getelementptr inbounds i8* %b.030, i64 1, !dbg !365
  %8 = load i8* %b.030, align 1, !dbg !365, !tbaa !358
  %incdec.ptr3 = getelementptr inbounds i8* %a.029, i64 1, !dbg !365
  store i8 %8, i8* %a.029, align 1, !dbg !365, !tbaa !358
  %tobool = icmp eq i64 %dec, 0, !dbg !365
  br i1 %tobool, label %return, label %while.body, !dbg !365, !llvm.loop !368

if.else:                                          ; preds = %if.end
  %sub = add i64 %count, -1, !dbg !369
  %tobool832 = icmp eq i64 %count, 0, !dbg !371
  br i1 %tobool832, label %return, label %while.body9.lr.ph, !dbg !371

while.body9.lr.ph:                                ; preds = %if.else
  %add.ptr5 = getelementptr inbounds i8* %src, i64 %sub, !dbg !372
  %add.ptr = getelementptr inbounds i8* %dst, i64 %sub, !dbg !369
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

vector.body235:                                   ; preds = %vector.body235, %vector.memcheck250
  %index238 = phi i64 [ %index.next260, %vector.body235 ], [ 0, %vector.memcheck250 ]
  %add.ptr5.sum465 = sub i64 %sub, %index238
  %add.ptr.sum497 = sub i64 %sub, %index238
  %next.gep262.sum = add i64 %add.ptr5.sum465, -15, !dbg !371
  %10 = getelementptr i8* %src, i64 %next.gep262.sum, !dbg !371
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !371
  %wide.load460 = load <16 x i8>* %11, align 1, !dbg !371
  %reverse = shufflevector <16 x i8> %wide.load460, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !371
  %.sum = add i64 %add.ptr5.sum465, -31, !dbg !371
  %12 = getelementptr i8* %src, i64 %.sum, !dbg !371
  %13 = bitcast i8* %12 to <16 x i8>*, !dbg !371
  %wide.load461 = load <16 x i8>* %13, align 1, !dbg !371
  %reverse462 = shufflevector <16 x i8> %wide.load461, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !371
  %reverse463 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !371
  %next.gep359.sum = add i64 %add.ptr.sum497, -15, !dbg !371
  %14 = getelementptr i8* %dst, i64 %next.gep359.sum, !dbg !371
  %15 = bitcast i8* %14 to <16 x i8>*, !dbg !371
  store <16 x i8> %reverse463, <16 x i8>* %15, align 1, !dbg !371
  %reverse464 = shufflevector <16 x i8> %reverse462, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !371
  %.sum531 = add i64 %add.ptr.sum497, -31, !dbg !371
  %16 = getelementptr i8* %dst, i64 %.sum531, !dbg !371
  %17 = bitcast i8* %16 to <16 x i8>*, !dbg !371
  store <16 x i8> %reverse464, <16 x i8>* %17, align 1, !dbg !371
  %index.next260 = add i64 %index238, 32
  %18 = icmp eq i64 %index.next260, %n.vec241
  br i1 %18, label %middle.block236, label %vector.body235, !llvm.loop !373

middle.block236:                                  ; preds = %vector.body235, %vector.memcheck250, %while.body9.lr.ph
  %resume.val251 = phi i8* [ %add.ptr5, %while.body9.lr.ph ], [ %add.ptr5, %vector.memcheck250 ], [ %rev.ptr.ind.end, %vector.body235 ]
  %resume.val253 = phi i8* [ %add.ptr, %while.body9.lr.ph ], [ %add.ptr, %vector.memcheck250 ], [ %rev.ptr.ind.end255, %vector.body235 ]
  %resume.val256 = phi i64 [ %count, %while.body9.lr.ph ], [ %count, %vector.memcheck250 ], [ %rev.ind.end257, %vector.body235 ]
  %new.indc.resume.val258 = phi i64 [ 0, %while.body9.lr.ph ], [ 0, %vector.memcheck250 ], [ %n.vec241, %vector.body235 ]
  %cmp.n259 = icmp eq i64 %new.indc.resume.val258, %count
  br i1 %cmp.n259, label %return, label %while.body9

while.body9:                                      ; preds = %while.body9, %middle.block236
  %b.135 = phi i8* [ %incdec.ptr10, %while.body9 ], [ %resume.val251, %middle.block236 ]
  %a.134 = phi i8* [ %incdec.ptr11, %while.body9 ], [ %resume.val253, %middle.block236 ]
  %count.addr.133 = phi i64 [ %dec7, %while.body9 ], [ %resume.val256, %middle.block236 ]
  %dec7 = add i64 %count.addr.133, -1, !dbg !371
  %incdec.ptr10 = getelementptr inbounds i8* %b.135, i64 -1, !dbg !371
  %19 = load i8* %b.135, align 1, !dbg !371, !tbaa !358
  %incdec.ptr11 = getelementptr inbounds i8* %a.134, i64 -1, !dbg !371
  store i8 %19, i8* %a.134, align 1, !dbg !371, !tbaa !358
  %tobool8 = icmp eq i64 %dec7, 0, !dbg !371
  br i1 %tobool8, label %return, label %while.body9, !dbg !371, !llvm.loop !374

return:                                           ; preds = %while.body9, %middle.block236, %if.else, %while.body, %middle.block, %while.cond.preheader, %entry
  ret i8* %dst, !dbg !375
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #6 {
entry:
  %cmp3 = icmp eq i64 %len, 0, !dbg !376
  br i1 %cmp3, label %while.end, label %while.body.preheader, !dbg !376

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

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep107 = getelementptr i8* %destaddr, i64 %index
  %1 = bitcast i8* %next.gep to <16 x i8>*, !dbg !377
  %wide.load = load <16 x i8>* %1, align 1, !dbg !377
  %next.gep.sum283 = or i64 %index, 16, !dbg !377
  %2 = getelementptr i8* %srcaddr, i64 %next.gep.sum283, !dbg !377
  %3 = bitcast i8* %2 to <16 x i8>*, !dbg !377
  %wide.load204 = load <16 x i8>* %3, align 1, !dbg !377
  %4 = bitcast i8* %next.gep107 to <16 x i8>*, !dbg !377
  store <16 x i8> %wide.load, <16 x i8>* %4, align 1, !dbg !377
  %next.gep107.sum300 = or i64 %index, 16, !dbg !377
  %5 = getelementptr i8* %destaddr, i64 %next.gep107.sum300, !dbg !377
  %6 = bitcast i8* %5 to <16 x i8>*, !dbg !377
  store <16 x i8> %wide.load204, <16 x i8>* %6, align 1, !dbg !377
  %index.next = add i64 %index, 32
  %7 = icmp eq i64 %index.next, %n.vec
  br i1 %7, label %middle.block, label %vector.body, !llvm.loop !378

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %while.body.preheader
  %resume.val = phi i8* [ %srcaddr, %while.body.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val9 = phi i8* [ %destaddr, %while.body.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end10, %vector.body ]
  %resume.val11 = phi i64 [ %len, %while.body.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %while.body.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %while.cond.while.end_crit_edge, label %while.body

while.body:                                       ; preds = %while.body, %middle.block
  %src.06 = phi i8* [ %incdec.ptr, %while.body ], [ %resume.val, %middle.block ]
  %dest.05 = phi i8* [ %incdec.ptr1, %while.body ], [ %resume.val9, %middle.block ]
  %len.addr.04 = phi i64 [ %dec, %while.body ], [ %resume.val11, %middle.block ]
  %dec = add i64 %len.addr.04, -1, !dbg !376
  %incdec.ptr = getelementptr inbounds i8* %src.06, i64 1, !dbg !377
  %8 = load i8* %src.06, align 1, !dbg !377, !tbaa !358
  %incdec.ptr1 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !377
  store i8 %8, i8* %dest.05, align 1, !dbg !377, !tbaa !358
  %cmp = icmp eq i64 %dec, 0, !dbg !376
  br i1 %cmp, label %while.cond.while.end_crit_edge, label %while.body, !dbg !376, !llvm.loop !379

while.cond.while.end_crit_edge:                   ; preds = %while.body, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %while.end, !dbg !376

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %dest.0.lcssa = phi i8* [ %scevgep, %while.cond.while.end_crit_edge ], [ %destaddr, %entry ]
  ret i8* %dest.0.lcssa, !dbg !380
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #6 {
entry:
  %cmp2 = icmp eq i64 %count, 0, !dbg !381
  br i1 %cmp2, label %while.end, label %while.body.lr.ph, !dbg !381

while.body.lr.ph:                                 ; preds = %entry
  %conv = trunc i32 %s to i8, !dbg !382
  br label %while.body, !dbg !381

while.body:                                       ; preds = %while.body, %while.body.lr.ph
  %a.04 = phi i8* [ %dst, %while.body.lr.ph ], [ %incdec.ptr, %while.body ]
  %count.addr.03 = phi i64 [ %count, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add i64 %count.addr.03, -1, !dbg !381
  %incdec.ptr = getelementptr inbounds i8* %a.04, i64 1, !dbg !382
  store volatile i8 %conv, i8* %a.04, align 1, !dbg !382, !tbaa !358
  %cmp = icmp eq i64 %dec, 0, !dbg !381
  br i1 %cmp, label %while.end, label %while.body, !dbg !381

while.end:                                        ; preds = %while.body, %entry
  ret i8* %dst, !dbg !383
}

; Function Attrs: nounwind uwtable
define double @klee_internal_sqrt(double %d) #6 {
entry:
  %call = tail call double @klee_sqrt_double(double %d) #8, !dbg !384
  ret double %call, !dbg !384
}

declare double @klee_sqrt_double(double) #3

; Function Attrs: nounwind uwtable
define float @klee_internal_sqrtf(float %f) #6 {
entry:
  %call = tail call float @klee_sqrt_float(float %f) #8, !dbg !385
  ret float %call, !dbg !385
}

declare float @klee_sqrt_float(float) #3

; Function Attrs: nounwind uwtable
define x86_fp80 @klee_internal_sqrtl(x86_fp80 %f) #6 {
entry:
  %call = tail call x86_fp80 @klee_sqrt_long_double(x86_fp80 %f) #8, !dbg !386
  ret x86_fp80 %call, !dbg !386
}

declare x86_fp80 @klee_sqrt_long_double(x86_fp80) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline nounwind optnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline optnone }
attributes #6 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nounwind }
attributes #9 = { nobuiltin noreturn nounwind }

!llvm.dbg.cu = !{!0, !19, !38, !67, !112, !122, !132, !143, !155, !165, !184, !198, !212, !227}
!llvm.module.flags = !{!240, !241}
!llvm.ident = !{!242, !242, !242, !242, !242, !242, !242, !242, !242, !242, !242, !242, !242, !242}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/
!1 = metadata !{metadata !"examples/get_sign/get_sign.c", metadata !"/home/unix-lc/klee-float"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9, metadata !15}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"get_sign", metadata !"get_sign", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (double)* @get_sign, null, null, metadata !2, i32 7} ; [ 
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/examples/get_sign/get_sign.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"klee_output", metadata !"klee_output", metadata !"", i32 16, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i8*, double)* @klee_output, null, null, metadata
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !12, metadata !8}
!12 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!14 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 21, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 21} ; [ DW_TAG_subprogram ]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = metadata !{i32 786449, metadata !20, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !21, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!20 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/fabs.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!21 = metadata !{metadata !22, metadata !26, metadata !32}
!22 = metadata !{i32 786478, metadata !20, metadata !23, metadata !"klee_internal_fabs", metadata !"klee_internal_fabs", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (double)* @klee_internal_fabs, nul
!23 = metadata !{i32 786473, metadata !20}        ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fabs.c]
!24 = metadata !{metadata !25}
!25 = metadata !{i32 786689, metadata !22, metadata !"d", metadata !23, i32 16777227, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d] [line 11]
!26 = metadata !{i32 786478, metadata !20, metadata !23, metadata !"klee_internal_fabsf", metadata !"klee_internal_fabsf", metadata !"", i32 15, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, float (float)* @klee_internal_fabsf, n
!27 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{metadata !29, metadata !29}
!29 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!30 = metadata !{metadata !31}
!31 = metadata !{i32 786689, metadata !26, metadata !"f", metadata !23, i32 16777231, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 15]
!32 = metadata !{i32 786478, metadata !20, metadata !23, metadata !"klee_internal_fabsl", metadata !"klee_internal_fabsl", metadata !"", i32 20, metadata !33, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, x86_fp80 (x86_fp80)* @klee_internal_fa
!33 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !34, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = metadata !{metadata !35, metadata !35}
!35 = metadata !{i32 786468, null, null, metadata !"long double", i32 0, i64 128, i64 128, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [long double] [line 0, size 128, align 128, offset 0, enc DW_ATE_float]
!36 = metadata !{metadata !37}
!37 = metadata !{i32 786689, metadata !32, metadata !"f", metadata !23, i32 16777236, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 20]
!38 = metadata !{i32 786449, metadata !39, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !40, metadata !2, metadata !57, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/hom
!39 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/fenv.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!40 = metadata !{metadata !41, metadata !50}
!41 = metadata !{i32 786436, metadata !42, null, metadata !"KleeRoundingMode", i32 183, i64 32, i64 32, i32 0, i32 0, null, metadata !43, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [KleeRoundingMode] [line 183, size 32, align 32, offset 0] [d
!42 = metadata !{metadata !"/home/unix-lc/klee-float/include/klee/klee.h", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!43 = metadata !{metadata !44, metadata !45, metadata !46, metadata !47, metadata !48, metadata !49}
!44 = metadata !{i32 786472, metadata !"KLEE_FP_RNE", i64 0} ; [ DW_TAG_enumerator ] [KLEE_FP_RNE :: 0]
!45 = metadata !{i32 786472, metadata !"KLEE_FP_RNA", i64 1} ; [ DW_TAG_enumerator ] [KLEE_FP_RNA :: 1]
!46 = metadata !{i32 786472, metadata !"KLEE_FP_RU", i64 2} ; [ DW_TAG_enumerator ] [KLEE_FP_RU :: 2]
!47 = metadata !{i32 786472, metadata !"KLEE_FP_RD", i64 3} ; [ DW_TAG_enumerator ] [KLEE_FP_RD :: 3]
!48 = metadata !{i32 786472, metadata !"KLEE_FP_RZ", i64 4} ; [ DW_TAG_enumerator ] [KLEE_FP_RZ :: 4]
!49 = metadata !{i32 786472, metadata !"KLEE_FP_UNKNOWN", i64 5} ; [ DW_TAG_enumerator ] [KLEE_FP_UNKNOWN :: 5]
!50 = metadata !{i32 786436, metadata !39, null, metadata !"", i32 15, i64 32, i64 32, i32 0, i32 0, null, metadata !51, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 15, size 32, align 32, offset 0] [def] [from ]
!51 = metadata !{metadata !52, metadata !53, metadata !54, metadata !55, metadata !56}
!52 = metadata !{i32 786472, metadata !"FE_TONEAREST", i64 0} ; [ DW_TAG_enumerator ] [FE_TONEAREST :: 0]
!53 = metadata !{i32 786472, metadata !"FE_DOWNWARD", i64 1024} ; [ DW_TAG_enumerator ] [FE_DOWNWARD :: 1024]
!54 = metadata !{i32 786472, metadata !"FE_UPWARD", i64 2048} ; [ DW_TAG_enumerator ] [FE_UPWARD :: 2048]
!55 = metadata !{i32 786472, metadata !"FE_TOWARDZERO", i64 3072} ; [ DW_TAG_enumerator ] [FE_TOWARDZERO :: 3072]
!56 = metadata !{i32 786472, metadata !"FE_TONEAREST_TIES_TO_AWAY", i64 3073} ; [ DW_TAG_enumerator ] [FE_TONEAREST_TIES_TO_AWAY :: 3073]
!57 = metadata !{metadata !58, metadata !62}
!58 = metadata !{i32 786478, metadata !39, metadata !59, metadata !"klee_internal_fegetround", metadata !"klee_internal_fegetround", metadata !"", i32 33, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @klee_internal_feget
!59 = metadata !{i32 786473, metadata !39}        ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fenv.c]
!60 = metadata !{metadata !61}
!61 = metadata !{i32 786688, metadata !58, metadata !"rm", metadata !59, i32 34, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rm] [line 34]
!62 = metadata !{i32 786478, metadata !39, metadata !59, metadata !"klee_internal_fesetround", metadata !"klee_internal_fesetround", metadata !"", i32 52, metadata !63, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @klee_internal_fe
!63 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{metadata !18, metadata !18}
!65 = metadata !{metadata !66}
!66 = metadata !{i32 786689, metadata !62, metadata !"rm", metadata !59, i32 16777268, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rm] [line 52]
!67 = metadata !{i32 786449, metadata !68, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !69, metadata !2, metadata !77, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/hom
!68 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!69 = metadata !{metadata !70}
!70 = metadata !{i32 786436, metadata !68, null, metadata !"", i32 58, i64 32, i64 32, i32 0, i32 0, null, metadata !71, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 58, size 32, align 32, offset 0] [def] [from ]
!71 = metadata !{metadata !72, metadata !73, metadata !74, metadata !75, metadata !76}
!72 = metadata !{i32 786472, metadata !"FP_NAN", i64 0} ; [ DW_TAG_enumerator ] [FP_NAN :: 0]
!73 = metadata !{i32 786472, metadata !"FP_INFINITE", i64 1} ; [ DW_TAG_enumerator ] [FP_INFINITE :: 1]
!74 = metadata !{i32 786472, metadata !"FP_ZERO", i64 2} ; [ DW_TAG_enumerator ] [FP_ZERO :: 2]
!75 = metadata !{i32 786472, metadata !"FP_SUBNORMAL", i64 3} ; [ DW_TAG_enumerator ] [FP_SUBNORMAL :: 3]
!76 = metadata !{i32 786472, metadata !"FP_NORMAL", i64 4} ; [ DW_TAG_enumerator ] [FP_NORMAL :: 4]
!77 = metadata !{metadata !78, metadata !84, metadata !89, metadata !94, metadata !97, metadata !100, metadata !103, metadata !106, metadata !109}
!78 = metadata !{i32 786478, metadata !68, metadata !79, metadata !"klee_internal_isnanf", metadata !"klee_internal_isnanf", metadata !"", i32 16, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (float)* @klee_internal_isnanf, 
!79 = metadata !{i32 786473, metadata !68}        ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!80 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !81, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!81 = metadata !{metadata !18, metadata !29}
!82 = metadata !{metadata !83}
!83 = metadata !{i32 786689, metadata !78, metadata !"f", metadata !79, i32 16777232, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 16]
!84 = metadata !{i32 786478, metadata !68, metadata !79, metadata !"klee_internal_isnan", metadata !"klee_internal_isnan", metadata !"", i32 21, metadata !85, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (double)* @klee_internal_isnan, nu
!85 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !86, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!86 = metadata !{metadata !18, metadata !8}
!87 = metadata !{metadata !88}
!88 = metadata !{i32 786689, metadata !84, metadata !"d", metadata !79, i32 16777237, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d] [line 21]
!89 = metadata !{i32 786478, metadata !68, metadata !79, metadata !"klee_internal_isnanl", metadata !"klee_internal_isnanl", metadata !"", i32 26, metadata !90, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (x86_fp80)* @klee_internal_isnan
!90 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !91, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!91 = metadata !{metadata !18, metadata !35}
!92 = metadata !{metadata !93}
!93 = metadata !{i32 786689, metadata !89, metadata !"d", metadata !79, i32 16777242, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d] [line 26]
!94 = metadata !{i32 786478, metadata !68, metadata !79, metadata !"klee_internal_fpclassifyf", metadata !"klee_internal_fpclassifyf", metadata !"", i32 67, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (float)* @klee_interna
!95 = metadata !{metadata !96}
!96 = metadata !{i32 786689, metadata !94, metadata !"f", metadata !79, i32 16777283, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 67]
!97 = metadata !{i32 786478, metadata !68, metadata !79, metadata !"klee_internal_fpclassify", metadata !"klee_internal_fpclassify", metadata !"", i32 82, metadata !85, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (double)* @klee_internal
!98 = metadata !{metadata !99}
!99 = metadata !{i32 786689, metadata !97, metadata !"f", metadata !79, i32 16777298, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 82]
!100 = metadata !{i32 786478, metadata !68, metadata !79, metadata !"klee_internal_fpclassifyl", metadata !"klee_internal_fpclassifyl", metadata !"", i32 98, metadata !90, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (x86_fp80)* @klee_int
!101 = metadata !{metadata !102}
!102 = metadata !{i32 786689, metadata !100, metadata !"ld", metadata !79, i32 16777314, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ld] [line 98]
!103 = metadata !{i32 786478, metadata !68, metadata !79, metadata !"klee_internal_finitef", metadata !"klee_internal_finitef", metadata !"", i32 114, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (float)* @klee_internal_fini
!104 = metadata !{metadata !105}
!105 = metadata !{i32 786689, metadata !103, metadata !"f", metadata !79, i32 16777330, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 114]
!106 = metadata !{i32 786478, metadata !68, metadata !79, metadata !"klee_internal_finite", metadata !"klee_internal_finite", metadata !"", i32 119, metadata !85, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (double)* @klee_internal_finit
!107 = metadata !{metadata !108}
!108 = metadata !{i32 786689, metadata !106, metadata !"f", metadata !79, i32 16777335, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 119]
!109 = metadata !{i32 786478, metadata !68, metadata !79, metadata !"klee_internal_finitel", metadata !"klee_internal_finitel", metadata !"", i32 124, metadata !90, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (x86_fp80)* @klee_internal_f
!110 = metadata !{metadata !111}
!111 = metadata !{i32 786689, metadata !109, metadata !"f", metadata !79, i32 16777340, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 124]
!112 = metadata !{i32 786449, metadata !113, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !114, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!113 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!114 = metadata !{metadata !115}
!115 = metadata !{i32 786478, metadata !113, metadata !116, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !117, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, 
!116 = metadata !{i32 786473, metadata !113}      ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_div_zero_check.c]
!117 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !118, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!118 = metadata !{null, metadata !119}
!119 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!120 = metadata !{metadata !121}
!121 = metadata !{i32 786689, metadata !115, metadata !"z", metadata !116, i32 16777228, metadata !119, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!122 = metadata !{i32 786449, metadata !123, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !124, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!123 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/klee_int.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!124 = metadata !{metadata !125}
!125 = metadata !{i32 786478, metadata !123, metadata !126, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !127, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !129, i32 13}
!126 = metadata !{i32 786473, metadata !123}      ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_int.c]
!127 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !128, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!128 = metadata !{metadata !18, metadata !12}
!129 = metadata !{metadata !130, metadata !131}
!130 = metadata !{i32 786689, metadata !125, metadata !"name", metadata !126, i32 16777229, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!131 = metadata !{i32 786688, metadata !125, metadata !"x", metadata !126, i32 14, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!132 = metadata !{i32 786449, metadata !133, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !134, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!133 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!134 = metadata !{metadata !135}
!135 = metadata !{i32 786478, metadata !133, metadata !136, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !137, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift
!136 = metadata !{i32 786473, metadata !133}      ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_overshift_check.c]
!137 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !138, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!138 = metadata !{null, metadata !139, metadata !139}
!139 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!140 = metadata !{metadata !141, metadata !142}
!141 = metadata !{i32 786689, metadata !135, metadata !"bitWidth", metadata !136, i32 16777236, metadata !139, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!142 = metadata !{i32 786689, metadata !135, metadata !"shift", metadata !136, i32 33554452, metadata !139, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!143 = metadata !{i32 786449, metadata !144, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !145, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!144 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/klee_range.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!145 = metadata !{metadata !146}
!146 = metadata !{i32 786478, metadata !144, metadata !147, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !148, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metada
!147 = metadata !{i32 786473, metadata !144}      ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_range.c]
!148 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !149, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!149 = metadata !{metadata !18, metadata !18, metadata !18, metadata !12}
!150 = metadata !{metadata !151, metadata !152, metadata !153, metadata !154}
!151 = metadata !{i32 786689, metadata !146, metadata !"start", metadata !147, i32 16777229, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!152 = metadata !{i32 786689, metadata !146, metadata !"end", metadata !147, i32 33554445, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!153 = metadata !{i32 786689, metadata !146, metadata !"name", metadata !147, i32 50331661, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!154 = metadata !{i32 786688, metadata !146, metadata !"x", metadata !147, i32 14, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!155 = metadata !{i32 786449, metadata !156, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !157, metadata !2, metadata !158, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [
!156 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/klee_set_rounding_mode.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!157 = metadata !{metadata !41}
!158 = metadata !{metadata !159}
!159 = metadata !{i32 786478, metadata !156, metadata !160, metadata !"klee_set_rounding_mode", metadata !"klee_set_rounding_mode", metadata !"", i32 16, metadata !161, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @klee_set_roundi
!160 = metadata !{i32 786473, metadata !156}      ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_set_rounding_mode.c]
!161 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !162, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!162 = metadata !{null, metadata !41}
!163 = metadata !{metadata !164}
!164 = metadata !{i32 786689, metadata !159, metadata !"rm", metadata !160, i32 16777232, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rm] [line 16]
!165 = metadata !{i32 786449, metadata !166, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !167, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!166 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/memcpy.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!167 = metadata !{metadata !168}
!168 = metadata !{i32 786478, metadata !166, metadata !169, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !170, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !177, i32
!169 = metadata !{i32 786473, metadata !166}      ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/memcpy.c]
!170 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !171, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!171 = metadata !{metadata !172, metadata !172, metadata !173, metadata !175}
!172 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!173 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !174} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!174 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!175 = metadata !{i32 786454, metadata !166, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !176} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!176 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!177 = metadata !{metadata !178, metadata !179, metadata !180, metadata !181, metadata !183}
!178 = metadata !{i32 786689, metadata !168, metadata !"destaddr", metadata !169, i32 16777228, metadata !172, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!179 = metadata !{i32 786689, metadata !168, metadata !"srcaddr", metadata !169, i32 33554444, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!180 = metadata !{i32 786689, metadata !168, metadata !"len", metadata !169, i32 50331660, metadata !175, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!181 = metadata !{i32 786688, metadata !168, metadata !"dest", metadata !169, i32 13, metadata !182, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!182 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!183 = metadata !{i32 786688, metadata !168, metadata !"src", metadata !169, i32 14, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!184 = metadata !{i32 786449, metadata !185, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !186, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!185 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/memmove.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!186 = metadata !{metadata !187}
!187 = metadata !{i32 786478, metadata !185, metadata !188, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !189, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !192, 
!188 = metadata !{i32 786473, metadata !185}      ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/memmove.c]
!189 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !190, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!190 = metadata !{metadata !172, metadata !172, metadata !173, metadata !191}
!191 = metadata !{i32 786454, metadata !185, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !176} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!192 = metadata !{metadata !193, metadata !194, metadata !195, metadata !196, metadata !197}
!193 = metadata !{i32 786689, metadata !187, metadata !"dst", metadata !188, i32 16777228, metadata !172, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!194 = metadata !{i32 786689, metadata !187, metadata !"src", metadata !188, i32 33554444, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!195 = metadata !{i32 786689, metadata !187, metadata !"count", metadata !188, i32 50331660, metadata !191, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!196 = metadata !{i32 786688, metadata !187, metadata !"a", metadata !188, i32 13, metadata !182, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!197 = metadata !{i32 786688, metadata !187, metadata !"b", metadata !188, i32 14, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!198 = metadata !{i32 786449, metadata !199, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !200, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!199 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/mempcpy.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!200 = metadata !{metadata !201}
!201 = metadata !{i32 786478, metadata !199, metadata !202, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !203, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !206, 
!202 = metadata !{i32 786473, metadata !199}      ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/mempcpy.c]
!203 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !204, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!204 = metadata !{metadata !172, metadata !172, metadata !173, metadata !205}
!205 = metadata !{i32 786454, metadata !199, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !176} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!206 = metadata !{metadata !207, metadata !208, metadata !209, metadata !210, metadata !211}
!207 = metadata !{i32 786689, metadata !201, metadata !"destaddr", metadata !202, i32 16777227, metadata !172, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!208 = metadata !{i32 786689, metadata !201, metadata !"srcaddr", metadata !202, i32 33554443, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!209 = metadata !{i32 786689, metadata !201, metadata !"len", metadata !202, i32 50331659, metadata !205, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!210 = metadata !{i32 786688, metadata !201, metadata !"dest", metadata !202, i32 12, metadata !182, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!211 = metadata !{i32 786688, metadata !201, metadata !"src", metadata !202, i32 13, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!212 = metadata !{i32 786449, metadata !213, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !214, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!213 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/memset.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!214 = metadata !{metadata !215}
!215 = metadata !{i32 786478, metadata !213, metadata !216, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !217, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !220, i32
!216 = metadata !{i32 786473, metadata !213}      ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/memset.c]
!217 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !218, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!218 = metadata !{metadata !172, metadata !172, metadata !18, metadata !219}
!219 = metadata !{i32 786454, metadata !213, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !176} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!220 = metadata !{metadata !221, metadata !222, metadata !223, metadata !224}
!221 = metadata !{i32 786689, metadata !215, metadata !"dst", metadata !216, i32 16777227, metadata !172, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!222 = metadata !{i32 786689, metadata !215, metadata !"s", metadata !216, i32 33554443, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!223 = metadata !{i32 786689, metadata !215, metadata !"count", metadata !216, i32 50331659, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!224 = metadata !{i32 786688, metadata !215, metadata !"a", metadata !216, i32 12, metadata !225, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!225 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !226} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!226 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!227 = metadata !{i32 786449, metadata !228, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !229, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!228 = metadata !{metadata !"/home/unix-lc/klee-float/runtime/Intrinsic/sqrt.c", metadata !"/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic"}
!229 = metadata !{metadata !230, metadata !234, metadata !237}
!230 = metadata !{i32 786478, metadata !228, metadata !231, metadata !"klee_internal_sqrt", metadata !"klee_internal_sqrt", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (double)* @klee_internal_sqrt, 
!231 = metadata !{i32 786473, metadata !228}      ; [ DW_TAG_file_type ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/sqrt.c]
!232 = metadata !{metadata !233}
!233 = metadata !{i32 786689, metadata !230, metadata !"d", metadata !231, i32 16777227, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d] [line 11]
!234 = metadata !{i32 786478, metadata !228, metadata !231, metadata !"klee_internal_sqrtf", metadata !"klee_internal_sqrtf", metadata !"", i32 15, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, float (float)* @klee_internal_sqrtf
!235 = metadata !{metadata !236}
!236 = metadata !{i32 786689, metadata !234, metadata !"f", metadata !231, i32 16777231, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 15]
!237 = metadata !{i32 786478, metadata !228, metadata !231, metadata !"klee_internal_sqrtl", metadata !"klee_internal_sqrtl", metadata !"", i32 20, metadata !33, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, x86_fp80 (x86_fp80)* @klee_internal
!238 = metadata !{metadata !239}
!239 = metadata !{i32 786689, metadata !237, metadata !"f", metadata !231, i32 16777236, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 20]
!240 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!241 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!242 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!243 = metadata !{i32 8, i32 0, metadata !244, null} ; [ DW_TAG_imported_declaration ]
!244 = metadata !{i32 786443, metadata !1, metadata !4, i32 8, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/examples/get_sign/get_sign.c]
!245 = metadata !{i32 9, i32 0, metadata !244, null}
!246 = metadata !{i32 10, i32 0, metadata !247, null}
!247 = metadata !{i32 786443, metadata !1, metadata !4, i32 10, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/examples/get_sign/get_sign.c]
!248 = metadata !{i32 11, i32 0, metadata !247, null}
!249 = metadata !{i32 13, i32 0, metadata !247, null}
!250 = metadata !{i32 14, i32 0, metadata !4, null}
!251 = metadata !{i32 18, i32 0, metadata !9, null}
!252 = metadata !{i32 23, i32 0, metadata !15, null}
!253 = metadata !{i32 24, i32 0, metadata !15, null}
!254 = metadata !{i32 25, i32 0, metadata !15, null}
!255 = metadata !{i32 26, i32 0, metadata !15, null}
!256 = metadata !{i32 12, i32 0, metadata !22, null}
!257 = metadata !{i32 16, i32 0, metadata !26, null}
!258 = metadata !{i32 21, i32 0, metadata !32, null}
!259 = metadata !{i32 34, i32 0, metadata !58, null}
!260 = metadata !{i32 35, i32 0, metadata !58, null}
!261 = metadata !{i32 50, i32 0, metadata !58, null}
!262 = metadata !{i32 53, i32 0, metadata !62, null}
!263 = metadata !{i32 55, i32 0, metadata !264, null}
!264 = metadata !{i32 786443, metadata !39, metadata !62, i32 53, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fenv.c]
!265 = metadata !{i32 56, i32 0, metadata !264, null}
!266 = metadata !{i32 66, i32 0, metadata !264, null}
!267 = metadata !{i32 67, i32 0, metadata !264, null}
!268 = metadata !{i32 69, i32 0, metadata !264, null}
!269 = metadata !{i32 70, i32 0, metadata !264, null}
!270 = metadata !{i32 72, i32 0, metadata !264, null}
!271 = metadata !{i32 73, i32 0, metadata !264, null}
!272 = metadata !{i32 79, i32 0, metadata !62, null}
!273 = metadata !{i32 17, i32 0, metadata !78, null}
!274 = metadata !{i32 22, i32 0, metadata !84, null}
!275 = metadata !{i32 27, i32 0, metadata !89, null}
!276 = metadata !{i32 69, i32 0, metadata !277, null}
!277 = metadata !{i32 786443, metadata !68, metadata !94, i32 69, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!278 = metadata !{i32 71, i32 0, metadata !279, null}
!279 = metadata !{i32 786443, metadata !68, metadata !277, i32 71, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!280 = metadata !{i32 73, i32 0, metadata !281, null}
!281 = metadata !{i32 786443, metadata !68, metadata !279, i32 73, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!282 = metadata !{i32 75, i32 0, metadata !283, null}
!283 = metadata !{i32 786443, metadata !68, metadata !281, i32 75, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!284 = metadata !{i32 76, i32 0, metadata !285, null}
!285 = metadata !{i32 786443, metadata !68, metadata !283, i32 75, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!286 = metadata !{i32 79, i32 0, metadata !94, null}
!287 = metadata !{i32 84, i32 0, metadata !288, null}
!288 = metadata !{i32 786443, metadata !68, metadata !97, i32 84, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!289 = metadata !{i32 86, i32 0, metadata !290, null}
!290 = metadata !{i32 786443, metadata !68, metadata !288, i32 86, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!291 = metadata !{i32 88, i32 0, metadata !292, null}
!292 = metadata !{i32 786443, metadata !68, metadata !290, i32 88, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!293 = metadata !{i32 90, i32 0, metadata !294, null}
!294 = metadata !{i32 786443, metadata !68, metadata !292, i32 90, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!295 = metadata !{i32 91, i32 0, metadata !296, null}
!296 = metadata !{i32 786443, metadata !68, metadata !294, i32 90, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!297 = metadata !{i32 94, i32 0, metadata !97, null}
!298 = metadata !{i32 100, i32 0, metadata !299, null}
!299 = metadata !{i32 786443, metadata !68, metadata !100, i32 100, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!300 = metadata !{i32 102, i32 0, metadata !301, null}
!301 = metadata !{i32 786443, metadata !68, metadata !299, i32 102, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!302 = metadata !{i32 104, i32 0, metadata !303, null}
!303 = metadata !{i32 786443, metadata !68, metadata !301, i32 104, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!304 = metadata !{i32 106, i32 0, metadata !305, null}
!305 = metadata !{i32 786443, metadata !68, metadata !303, i32 106, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!306 = metadata !{i32 107, i32 0, metadata !307, null}
!307 = metadata !{i32 786443, metadata !68, metadata !305, i32 106, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/fpclassify.c]
!308 = metadata !{i32 110, i32 0, metadata !100, null}
!309 = metadata !{i32 115, i32 0, metadata !103, null}
!310 = metadata !{i32 120, i32 0, metadata !106, null}
!311 = metadata !{i32 125, i32 0, metadata !109, null}
!312 = metadata !{i32 13, i32 0, metadata !313, null}
!313 = metadata !{i32 786443, metadata !113, metadata !115, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_div_zero_check.c]
!314 = metadata !{i32 14, i32 0, metadata !313, null}
!315 = metadata !{i32 15, i32 0, metadata !115, null}
!316 = metadata !{i32 15, i32 0, metadata !125, null}
!317 = metadata !{i32 16, i32 0, metadata !125, null}
!318 = metadata !{metadata !319, metadata !319, i64 0}
!319 = metadata !{metadata !"int", metadata !320, i64 0}
!320 = metadata !{metadata !"omnipotent char", metadata !321, i64 0}
!321 = metadata !{metadata !"Simple C/C++ TBAA"}
!322 = metadata !{i32 21, i32 0, metadata !323, null}
!323 = metadata !{i32 786443, metadata !133, metadata !135, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_overshift_check.c]
!324 = metadata !{i32 27, i32 0, metadata !325, null}
!325 = metadata !{i32 786443, metadata !133, metadata !323, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_overshift_check.c]
!326 = metadata !{i32 29, i32 0, metadata !135, null}
!327 = metadata !{i32 16, i32 0, metadata !328, null}
!328 = metadata !{i32 786443, metadata !144, metadata !146, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_range.c]
!329 = metadata !{i32 17, i32 0, metadata !328, null}
!330 = metadata !{i32 19, i32 0, metadata !331, null}
!331 = metadata !{i32 786443, metadata !144, metadata !146, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_range.c]
!332 = metadata !{i32 22, i32 0, metadata !333, null}
!333 = metadata !{i32 786443, metadata !144, metadata !331, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_range.c]
!334 = metadata !{i32 25, i32 0, metadata !335, null}
!335 = metadata !{i32 786443, metadata !144, metadata !333, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_range.c]
!336 = metadata !{i32 26, i32 0, metadata !337, null}
!337 = metadata !{i32 786443, metadata !144, metadata !335, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_range.c]
!338 = metadata !{i32 27, i32 0, metadata !337, null}
!339 = metadata !{i32 28, i32 0, metadata !340, null}
!340 = metadata !{i32 786443, metadata !144, metadata !335, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_range.c]
!341 = metadata !{i32 29, i32 0, metadata !340, null}
!342 = metadata !{i32 32, i32 0, metadata !333, null}
!343 = metadata !{i32 34, i32 0, metadata !146, null}
!344 = metadata !{i32 19, i32 0, metadata !159, null}
!345 = metadata !{i32 21, i32 0, metadata !346, null}
!346 = metadata !{i32 786443, metadata !156, metadata !159, i32 19, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/klee_set_rounding_mode.c]
!347 = metadata !{i32 23, i32 0, metadata !346, null}
!348 = metadata !{i32 25, i32 0, metadata !346, null}
!349 = metadata !{i32 27, i32 0, metadata !346, null}
!350 = metadata !{i32 29, i32 0, metadata !346, null}
!351 = metadata !{i32 31, i32 0, metadata !346, null}
!352 = metadata !{i32 33, i32 0, metadata !159, null}
!353 = metadata !{i32 16, i32 0, metadata !168, null}
!354 = metadata !{i32 17, i32 0, metadata !168, null}
!355 = metadata !{metadata !355, metadata !356, metadata !357}
!356 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!357 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!358 = metadata !{metadata !320, metadata !320, i64 0}
!359 = metadata !{metadata !359, metadata !356, metadata !357}
!360 = metadata !{i32 18, i32 0, metadata !168, null}
!361 = metadata !{i32 16, i32 0, metadata !362, null}
!362 = metadata !{i32 786443, metadata !185, metadata !187, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/memmove.c]
!363 = metadata !{i32 19, i32 0, metadata !364, null}
!364 = metadata !{i32 786443, metadata !185, metadata !187, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/memmove.c]
!365 = metadata !{i32 20, i32 0, metadata !366, null}
!366 = metadata !{i32 786443, metadata !185, metadata !364, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/memmove.c]
!367 = metadata !{metadata !367, metadata !356, metadata !357}
!368 = metadata !{metadata !368, metadata !356, metadata !357}
!369 = metadata !{i32 22, i32 0, metadata !370, null}
!370 = metadata !{i32 786443, metadata !185, metadata !364, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/unix-lc/klee-float/cmake-build-debug/runtime/Intrinsic//home/unix-lc/klee-float/runtime/Intrinsic/memmove.c]
!371 = metadata !{i32 24, i32 0, metadata !370, null}
!372 = metadata !{i32 23, i32 0, metadata !370, null}
!373 = metadata !{metadata !373, metadata !356, metadata !357}
!374 = metadata !{metadata !374, metadata !356, metadata !357}
!375 = metadata !{i32 28, i32 0, metadata !187, null}
!376 = metadata !{i32 15, i32 0, metadata !201, null}
!377 = metadata !{i32 16, i32 0, metadata !201, null}
!378 = metadata !{metadata !378, metadata !356, metadata !357}
!379 = metadata !{metadata !379, metadata !356, metadata !357}
!380 = metadata !{i32 17, i32 0, metadata !201, null}
!381 = metadata !{i32 13, i32 0, metadata !215, null}
!382 = metadata !{i32 14, i32 0, metadata !215, null}
!383 = metadata !{i32 15, i32 0, metadata !215, null}
!384 = metadata !{i32 12, i32 0, metadata !230, null}
!385 = metadata !{i32 16, i32 0, metadata !234, null}
!386 = metadata !{i32 21, i32 0, metadata !237, null}
