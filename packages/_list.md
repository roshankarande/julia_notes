# Other packages

* Test
* SparseArrays
* Distributed
* StaticArrays
* Symbolics
* IntervalArithmetic 
* DataFramesMeta  * # prefer this one over Query .. both are good*
* Query https://github.com/queryverse/Query.jl
* Roots # for finding the roots of a polynomial


```julia
using Roots
f(x) =  x^5 - x + 1/2

find_zero(f, 0.6) # find zero root near 0.6
find_zero(f, (-1.2,  -1))  # -1.0983313019186336... find zeros in [-1.2 -1]

julia> find_zeros(f, -5,  5)  # find zeros in [-5 5]
3-element Vector{Float64}: #  [-1.0983313019186334, 0.550606579334135,  0.7690997031778959 ]
```