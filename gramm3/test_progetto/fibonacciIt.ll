define double @fibo(double %n) {
entry:
  %oldb = alloca double, align 8
  %i2 = alloca double, align 8
  %i = alloca double, align 8
  %b = alloca double, align 8
  %a = alloca double, align 8
  %n1 = alloca double, align 8
  store double %n, ptr %n1, align 8
  store double 0.000000e+00, ptr %a, align 8
  store double 1.000000e+00, ptr %b, align 8
  store double 1.000000e+00, ptr %i, align 8
  br label %cond

cond:                                             ; preds = %loop, %entry
  %i3 = load double, ptr %i, align 8
  %n4 = load double, ptr %n1, align 8
  %lttest = fcmp ult double %i3, %n4
  br i1 %lttest, label %loop, label %merge

loop:                                             ; preds = %cond
  %b5 = load double, ptr %b, align 8
  store double %b5, ptr %oldb, align 8
  %a6 = load double, ptr %a, align 8
  %b7 = load double, ptr %b, align 8
  %addres = fadd double %a6, %b7
  store double %addres, ptr %b, align 8
  %oldb8 = load double, ptr %oldb, align 8
  store double %oldb8, ptr %a, align 8
  %i9 = load double, ptr %i, align 8
  %inc = fadd double %i9, 1.000000e+00
  store double %inc, ptr %i, align 8
  br label %cond

merge:                                            ; preds = %cond
  %b10 = load double, ptr %b, align 8
  ret double %b10
}

