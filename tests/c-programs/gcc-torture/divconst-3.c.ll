; ModuleID = './divconst-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @f(i64 %x) #0 {
  %1 = alloca i64, align 8
  store i64 %x, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = sdiv i64 %2, 10000000000
  ret i64 %3
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i64 @f(i64 10000000000)
  %3 = icmp ne i64 %2, 1
  br i1 %3, label %7, label %4

; <label>:4                                       ; preds = %0
  %5 = call i64 @f(i64 100000000000)
  %6 = icmp ne i64 %5, 10
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4, %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %4
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %10 = load i32, i32* %1
  ret i32 %10
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
