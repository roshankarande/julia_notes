
https://docs.julialang.org/en/v1/manual/control-flow/#Exception-Handling

```julia
#DomainError
function fact(n)
    isinteger(n) && n >= 0 || throw(DomainError(n, "argument must be non-negative integer"))
    return n == 0 ? 1 : n * fact(n - 1)
end
```


## Assert

```julia
struct Card
    suit :: Int64
    rank :: Int64
    function Card(suit::Int64, rank::Int64)
        @assert(1 ≤ suit ≤ 4, "suit is not between 1 and 4")
        @assert(1 ≤ rank ≤ 13, "rank is not between 1 and 13")
        new(suit, rank)
    end
end
```