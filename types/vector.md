
```julia
v = [1:4...] # [1,2,3,4] 
v = collect(1:4)
typeof(v)    # Vector{Int64} (alias for Array{Int64, 1})
ndims(v)     # 1
length(v)
eltype(v)    # element typle ... Int64

norm(v,k) # kth norm of v, by default 2... Inf to find the infinity norm of v

v[begin], v[end]   # (1, 4)
v[[2,3]]           # [2,3]
v[:]    # all elements
v[1:2:end]   #  [1,3]

v[1:end .!= 3 ]  # all entries except the third one
```


```julia
append!(v,5)
v = Float64[1,2,3] # [1.0, 2.0, 3.0]
v[:] .= 8 # element wise assignment of all items of v

```