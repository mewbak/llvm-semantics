; ModuleID = './20080522-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@p = internal global i32* @i, align 8
@i = internal global i32 0, align 4

; Function Attrs: noinline nounwind uwtable
define i32 @foo(i32* %q) #0 {
  %1 = alloca i32*, align 8
  store i32* %q, i32** %1, align 8
  %2 = load i32*, i32** @p, align 8
  store i32 1, i32* %2, align 4
  %3 = load i32*, i32** %1, align 8
  store i32 2, i32* %3, align 4
  %4 = load i32*, i32** @p, align 8
  %5 = load i32, i32* %4, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind uwtable
define i32 @bar(i32* %q) #0 {
  %1 = alloca i32*, align 8
  store i32* %q, i32** %1, align 8
  %2 = load i32*, i32** %1, align 8
  store i32 2, i32* %2, align 4
  %3 = load i32*, i32** @p, align 8
  store i32 1, i32* %3, align 4
  %4 = load i32*, i32** %1, align 8
  %5 = load i32, i32* %4, align 4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %j, align 4
  %2 = call i32 @foo(i32* @i)
  %3 = icmp ne i32 %2, 2
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @bar(i32* @i)
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #3
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @foo(i32* %j)
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #3
  unreachable

; <label>:13                                      ; preds = %9
  %14 = load i32, i32* %j, align 4
  %15 = icmp ne i32 %14, 2
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #3
  unreachable

; <label>:17                                      ; preds = %13
  %18 = call i32 @bar(i32* %j)
  %19 = icmp ne i32 %18, 2
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #3
  unreachable

; <label>:21                                      ; preds = %17
  %22 = load i32, i32* %j, align 4
  %23 = icmp ne i32 %22, 2
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #3
  unreachable

; <label>:25                                      ; preds = %21
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
