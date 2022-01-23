# Methods

Tne function consists of multiple methods. A prime example is the convert function. When a user calls a function, the process of choosing which method to execute is called dispatch. 

The dispatch system in Julia decides which method to execute based on:
* the number of function arguments;
* the types of function arguments.
  
Using all function arguments to choose which method should be invoked is known as multiple dispatch.

```julia

# Since we want to create a function that computes the product of two numbers, it makes sense to allow input arguments to be only numbers.
product(x::Number, y::Number) = x * y
product(x, y) = throw(ArgumentError("product is defined for numbers only."))
# The second line redefined the original definition of the product function. It now throws an error if product is called with non-numeric inputs.

methods(product) # lists all the methods on function product
```

## Type hierarchy
It is always better to use abstract types like Number or Real instead of concrete types like Float64, Float32, or Int64. The reason is that if we use an abstract type, the function will work for all its subtypes. 

```julia
# To find a supertype for a specific type, we can use the supertype function from the InteractiveUtils package.
using InteractiveUtils
supertype(Float64) #Abstract Float

We can check the type hierarchy by the <: operator for comparing types: If T1 <: T2 is true, then T1 is a subtype (or the same type) of T2.

Float64 <: AbstractFloat <: Real <: Number # true

subtypes(Number) 
# 2-element Vector{Any}:
#  Complex
#  Real
```

