; ModuleID = './loop-4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %j = alloca i32, align 4
  %i = alloca i64, align 8
  store i32 1, i32* %j, align 4
  store i64 -1879048192, i64* %i, align 8
  br label %1

; <label>:1                                       ; preds = %7, %0
  %2 = load i64, i64* %i, align 8
  %3 = icmp slt i64 %2, 1610612736
  br i1 %3, label %4, label %10

; <label>:4                                       ; preds = %1
  %5 = load i32, i32* %j, align 4
  %6 = shl i32 %5, 1
  store i32 %6, i32* %j, align 4
  br label %7

; <label>:7                                       ; preds = %4
  %8 = load i64, i64* %i, align 8
  %9 = add nsw i64 %8, 268435456
  store i64 %9, i64* %i, align 8
  br label %1

; <label>:10                                      ; preds = %1
  %11 = load i32, i32* %j, align 4
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f()
  %3 = icmp ne i32 %2, 8192
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32, i32* %1
  ret i32 %7
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
