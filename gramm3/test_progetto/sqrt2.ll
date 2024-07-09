define double @iterate(double %y, double %x) {
entry:
  %z5 = alloca double, align 8
  %z = alloca double, align 8
  %eps = alloca double, align 8
  %x2 = alloca double, align 8
  %y1 = alloca double, align 8
  store double %y, ptr %y1, align 8
  store double %x, ptr %x2, align 8
  store double 1.000000e-04, ptr %eps, align 8
  %x3 = load double, ptr %x2, align 8
  %x4 = load double, ptr %x2, align 8
  %mulres = fmul double %x3, %x4
  store double %mulres, ptr %z, align 8
  br label %cond

cond:                                             ; preds = %loop, %entry
  %eps6 = load double, ptr %eps, align 8
  %y7 = load double, ptr %y1, align 8
  %z8 = load double, ptr %z, align 8
  %subres = fsub double %y7, %z8
  %lttest = fcmp ult double %eps6, %subres
  %eps9 = load double, ptr %eps, align 8
  %z10 = load double, ptr %z, align 8
  %y11 = load double, ptr %y1, align 8
  %subres12 = fsub double %z10, %y11
  %lttest13 = fcmp ult double %eps9, %subres12
  %or = or i1 %lttest13, %lttest
  br i1 %or, label %loop, label %merge

loop:                                             ; preds = %cond
  %x14 = load double, ptr %x2, align 8
  %x15 = load double, ptr %x2, align 8
  %mulres16 = fmul double %x14, %x15
  store double %mulres16, ptr %z, align 8
  %x17 = load double, ptr %x2, align 8
  %y18 = load double, ptr %y1, align 8
  %x19 = load double, ptr %x2, align 8
  %addres = fdiv double %y18, %x19
  %addres20 = fadd double %x17, %addres
  %addres21 = fdiv double %addres20, 2.000000e+00
  store double %addres21, ptr %x2, align 8
  br label %cond

merge:                                            ; preds = %cond
  %x22 = load double, ptr %x2, align 8
  ret double %x22
}

define double @sqrt(double %y) {
entry:
  %y1 = alloca double, align 8
  store double %y, ptr %y1, align 8
  %y2 = load double, ptr %y1, align 8
  %eqtest = fcmp ueq double %y2, 1.000000e+00
  br i1 %eqtest, label %trueexp, label %falseexp

trueexp:                                          ; preds = %entry
  br label %endcond11

falseexp:                                         ; preds = %entry
  %y3 = load double, ptr %y1, align 8
  %lttest = fcmp ult double %y3, 1.000000e+00
  br i1 %lttest, label %trueexp4, label %falseexp7

trueexp4:                                         ; preds = %falseexp
  %y5 = load double, ptr %y1, align 8
  %y6 = load double, ptr %y1, align 8
  %subres = fsub double 1.000000e+00, %y6
  %calltmp = call double @iterate(double %y5, double %subres)
  br label %endcond

falseexp7:                                        ; preds = %falseexp
  %y8 = load double, ptr %y1, align 8
  %y9 = load double, ptr %y1, align 8
  %addres = fdiv double %y9, 2.000000e+00
  %calltmp10 = call double @iterate(double %y8, double %addres)
  br label %endcond

endcond:                                          ; preds = %falseexp7, %trueexp4
  %condval = phi double [ %calltmp, %trueexp4 ], [ %calltmp10, %falseexp7 ]
  br label %endcond11

endcond11:                                        ; preds = %endcond, %trueexp
  %condval12 = phi double [ 1.000000e+00, %trueexp ], [ %condval, %endcond ]
  ret double %condval12
}

