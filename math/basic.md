```julia
# Function	     # Tests if
isequal(x, y)	 # x and y are identical
isfinite(x)	     # x is a finite number
isinf(x) 	     # x is infinite
isnan(x)	     # x is not a number
```

```julia
round(x)	# round x to the nearest integer
floor(x)	# round x towards -Inf
ceil(x)	    # round x towards +Inf
trunc(x)	# round x towards zero
abs(x)      # absolute value
sum(v)      # sum of elements in x
prod(v)     # product of elements in x
cumsum(v)   # returns a vector with cumulative sum of elements in vector v

minimum(v) # minimum of v
maximum(v) # maximum of v
extrema(v) # extrema of v ... i.e both the minimum and maximum
# extrema(2:10), extrema([2,1,5]), extrema(x-> abs(x), -4:3)


factorial(5) # 120
binomial(n,k) # n choose k

x = 1234.555353           #  1234.555353

# If the digits keyword argument is provided, it rounds to the specified number of digits after the decimal place
round(x,digits= 4)        #  1234.5554   
# If the sigdigits keyword argument is provided, it rounds to the specified number of significant digits
round(x,sigdigits= 2)     #  1200.0

zero(n)  # returns zero for typeof(n)... e.g. zero(2.3) -> 0.0
one(n) # dimensionless
oneunit(n) # dimension based .. e.g using Dates; one(Dates.Day) -> 1 day
```

