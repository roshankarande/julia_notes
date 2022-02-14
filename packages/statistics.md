# Statistics

```julia
using Statistics

x = rand(10)
mean(x), var(x), std(x)

# cor(X::AbstractMatrix; dims::Int=1)
# cor(x::AbstractVector, y::AbstractVector)

```

# StatsBase

```julia
sample(1:100, 10, replace = false)
```