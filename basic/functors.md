# Function-like objects - functors


Methods are associated with types, so it is possible to make any arbitrary Julia object "callable" by adding methods to its type. (Such "callable" objects are sometimes called "functors.")

For example, you can define a type that stores the coefficients of a polynomial, but behaves like a function evaluating the polynomial:

```julia
struct Polynomial{R}
  coeffs::Vector{R}
end

function (p::Polynomial)(x)
    v = p.coeffs[end]
    for i = (length(p.coeffs)-1):-1:1
        v = v*x + p.coeffs[i]
    end
    return v
end

(p::Polynomial)() = p(5)
```
Notice that the function is specified by type instead of by name. As with normal functions there is a terse syntax form. In the function body, p will refer to the object that was called. A Polynomial can be used as follows:


```julia
p = Polynomial([1,10,100]) # Polynomial{Int64}([1, 10, 100])
p(3)   # 931
p()    # 2551
```