
### ndigits
```julia
ndigits(n::Integer; base::Integer=10, pad::Integer=1)
```

Compute the number of digits in integer n written in base base (base must not be in [-1, 0, 1]), optionally padded with zeros to a specified size (the result will never be less than pad).

### digits
```julia
digits([T<:Integer], n::Integer; base::T = 10, pad::Integer = 1)

digits(10, base = 2)  
# 4-element Vector{Int64}:
#  0
#  1
#  0
#  1
```
Returns an array with element type T (default Int) of the digits of n in the given base, optionally padded with zeros to a specified size. More significant digits are at higher indices, such that n == sum(digits[k]*base^(k-1) for k=1:length(digits)).

