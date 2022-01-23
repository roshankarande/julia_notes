

```julia
function gauss(x::Real; μ::Real = 0, σ::Real = 1)
    σ^2 > 0 || error("the variance `σ^2` must be positive")
    return exp(-1/2 * ((x - μ)/σ)^2)/(σ * sqrt(2*π))
end

s = 0.01
x = -100:s:100
sum(gauss, x)*s # same as sum(gauss.(x))*s ... in this case
```
## Optional arguments and optional keyword arguments

```julia
hello(x = "world") = println("Hello $(x).") # optional argument x
hello()
hello("people")

linear(x; a = 1, b = 0) = a*x + b # notice the semi colon ; after (;) the arguments are keyword arguments
linear(2)
linear(2; a = 2, b = 1)

a,b = 4,3
linear(2;a,b) # shortcut for linear(2; a = a, b = b)
```

## vardiac arguments

```julia
nargs(x...) = println("Number of arguments: ", length(x))

args = (1, 2, 3)
nargs(args[1], args[2], args[3]) 
nargs(args...) # length would be 3
nargs(args) # this is different and would have length 1 ... as tuple is not unpacked
nargs(1:100...)
nargs([1,2,3]...)
```

### vardiac keyword arguments
```julia
roundmod(x, y; kwargs...) = round(mod(x, y); kwargs...)  # here this is semicolon ; 
roundmod(12.529, 5; digits = 2)
roundmod(12.529, 5; sigdigits = 2)
```

## Anonymous functions

```julia
f1 = function (x) 
    x^2 + 2x + 1
end

f2 = x -> x^2 + 2x + 1

# Primary usage is to pass them to functions that take other functions as arguments
using Plots
plot(-1:0.01:1, x -> x^2 )

# Another example is the map function, which applies a function to each value of an iterable object and returns a new array containing the resulting values.
map(x -> x^2 + 2x - 1, [1,3,-1])  # [2, 14, -2]

```