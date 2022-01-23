
## Syntax

```julia
[f(x, y, ...) for x in X, y in Y, ...]
[(x, y, x + y)  for x in 1:10, y in 1:10 if x + y < 5]
```

```julia
B = [   -1  0  2;   2  -3  1 ]
A1 = 1/2 *[ exp((B[i,j] + 1)^2) for i ∈ 1:2, j ∈ 1:3 ]   # this will create a 2x3 matrix
A2 = 1/2 *[ exp((B[i,j] + 1)^2) for i ∈ 1:2 for j ∈ 1:3 ] # this will create a 6 element vector 
# If a vector is created row-wise of elements of A1, it will be same as A2

A3 = exp.((B .+ 1) .^ 2) ./ 2
A4 = @. 1/2*exp((B + 1) ^ 2)  # @. macro automatically adds a dot before each operator and each function

```

## Generator expressions

List comprehensions can also be written without the enclosing square brackets. This produces an object known as a generator. When iterating over a generator, the values are generated on demand instead of pre-allocating an array. For example, the following expression sums a series without allocating the full array in memory.

```julia
gen = (1/n^2 for n in 1:1000); # Base.Generator{UnitRange{Int64}, var"#5#6"}(var"#5#6"(), 1:1000)
sum(gen) # 1.6439345666815615

@benchmark sum(1/n^2 for n in 1:1000)   #  Memory estimate: 0 bytes, allocs estimate: 0.  Mean Time  984.177 ns
@benchmark sum([1/n^2 for n in 1:1000]) #  Memory estimate: 7.94 KiB, allocs estimate: 1. Mean Time  4.38 μs


gen = ((i,j) for i in 1:3, j in 1:2 if i + j < 3)
collect(gen)

# Iterables may refer to outer loop variables. However, in such a case, it is necessary to use the for keyword before each iterable statement, and the result will be a vector....

gen = ((i,j) for i in 1:3 for j in 1:i) # if you refer to outer variable.. here i and use , j in 1:i ... you get wrong ouput
collect(gen)



```