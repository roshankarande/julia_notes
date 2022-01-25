```julia
propertynames(x, private=false)
```
  Get a tuple or a vector of the properties (x.property) of an object x. This is typically the same as fieldnames(typeof(x))
  
```julia

# Reflection...
fieldnames(typeof(x)
methodswith(typ[, module or function]; supertypes::Bool=false]) # Return an array of methods with an argument of type typ.
methodswith(Poisson; supertypes=true)  # using Distributions

methods(f, [types], [module])  #  Return the method table for function f

```

* On the one hand, methodswith tells you about functions that have been written with methods that take specific types (or optionally their supertypes) for arguments in any position.
* On the other hand, Any is excluded from the list of supertypes considered by methodswith (otherwise the output would be endless), but for many types there are numberless generic functions that work with them, even without the authors of the type or the function taking care of that.
* Also, the output of methodswith is not fixed, but depends on what packages are loaded.

```julia
2 == 2 == 3 # false
2 == 2 == 2 # true 
```

```julia
x, y = [1,2,3], [4,5,6]
x .- y   # [-3, -3, -3]
x .- y'  #  [-3 -4 -5; -2 -3 -4; -1 -2 -3]  # tricky but will work even if the dimensions of x and y are not same
```