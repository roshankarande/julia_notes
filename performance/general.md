https://docs.julialang.org/en/v1/manual/performance-tips/

## Global variables

It is not recommended to use global variables in inside a function. The reason is that global variables can change their type and value at any time, and therefore they cannot be properly optimized by the compiler. 

```julia
x,y = rand(10) ,rand(10)
f1() = x .+ y
f2(x,y) = x .+y

@time f1()      # slower, more memory
@time f2(x,y)   # faster, also less memory

# The reason is that when we call the f2() for the first time, the function is optimized for the given arguments. Each time a function is called for the first time with new types of arguments, it is compiled. This can be seen in the following example: the first call is slower due to the compilation.

# f1() function cannot be optimized because it contains two global variables, and these two variables can change at any time.

```

## Avoid Changing the type of variable
```julia
function foo()
    x = 1 # x starts as int and then becomes float... rather do x = 1.0 || x::Float64 = 1 || x = oneunit(Float64)
    for i = 1:10
        x /= rand()
    end
    return x
end
```



## Tools
https://docs.julialang.org/en/v1/manual/performance-tips/
Tools section on this page


Profiling allows you to measure the performance of your running code and identify lines that serve as bottlenecks. For complex projects, the ProfileView package can help you visualize your profiling results.

The Traceur package can help you find common performance problems in your code.

Unexpectedly-large memory allocations–as reported by @time, @allocated, or the profiler (through calls to the garbage-collection routines)–hint that there might be issues with your code. 
If you don't see another reason for the allocations, suspect a type problem. You can also start Julia with the --track-allocation=user option and examine the resulting *.mem files to see information about where those allocations occur. See Memory allocation analysis.

@code_warntype generates a representation of your code that can be helpful in finding expressions that result in type uncertainty. See @code_warntype below.