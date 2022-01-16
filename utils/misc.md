```julia
propertynames(x, private=false)
```
  Get a tuple or a vector of the properties (x.property) of an object x. This is typically the same as fieldnames(typeof(x))
  
```julia
fieldnames(typeof(x)
```

```julia
2 == 2 == 3 # false
2 == 2 == 2 # true 
```

```julia
x, y = [1,2,3], [4,5,6]
x .- y   # [-3, -3, -3]
x .- y'  #  [-3 -4 -5; -2 -3 -4; -1 -2 -3]  # tricky but will work even if the dimensions of x and y are not same
```