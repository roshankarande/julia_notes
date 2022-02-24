## StatsBase.jl

https://juliastats.org/StatsBase.jl/stable/


```julia
using StatsBase
keywords = ["abc", "bac", "abc"]
countmap(keywords) # Return a dictionary mapping each unique value in x to its number of occurrences
#  Output is 
#   "abc" => 2, "bac" => 1

countmap("Hello")
#   'H' => 1, 'l' => 2, 'e' => 1, 'o' => 1
```