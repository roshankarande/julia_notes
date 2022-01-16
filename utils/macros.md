
```julia
@. # automatically adds a dot before each operator and each function
B = rand(4,4)
t = @. exp((B + 1) ^ 2) / 2 == exp.((B .+ 1) .^ 2) ./ 2
all(t) # true
```
 
```julia
@view
@views


```