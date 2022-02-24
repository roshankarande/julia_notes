```julia
using Zygote
f(x) = x^3
f(2) # 8
f'(2) # derivative of f at 2 -> 12
# gradient
f'(:x)
```


## ForwardDiff

```julia
g((x,y))  = sin(x) + y
ForwardDiff.gradient(g,[1,1])
```