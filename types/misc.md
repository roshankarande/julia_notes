```julia
typeof(111) # Int64
isa(1, Int64) # true # equivalent to typeof(1) <: Int64
isabstracttype(Real) # true
isconcretetype(Real) # false
```

```julia
string(111)  # "111"
```

```julia
typemin(Int64)   # 
typemax(Int64)   # 9223372036854775807
```

