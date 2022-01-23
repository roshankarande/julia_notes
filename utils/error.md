
https://docs.julialang.org/en/v1/manual/control-flow/#Exception-Handling

```julia
#DomainError
function fact(n)
    isinteger(n) && n >= 0 || throw(DomainError(n, "argument must be non-negative integer"))
    return n == 0 ? 1 : n * fact(n - 1)
end
```