https://docs.julialang.org/en/v1/manual/performance-tips/

### Global variables

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
