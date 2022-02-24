```julia
d = Dict("a" => [1,2,3], "b" => 12)
d = Dict(:a => [1,2,3], :b => 12) # here we are using symbols "a" is not same as :a

values(d) # values of dictionary
keys(d) # keys of dictionary

d["a"] or d[:a]

haskey(d,:a) or haskey(d,"a")
get(d,:c,0) # 0 is the value returned if key is not present
get!(d, :c, 0) # adds the pair(c,0) if key c is not present in d

delete!(d,:c)

# An alternative to delete is the pop! function, which removes the key from the dictionary, and returns the value corresponding to it. Optionally, it is possible to add a default value for a given key to the pop! function, which is returned if the key does not exist in the given dictionary.
pop!(d, :c)
pop!(d, :c, 444)
```