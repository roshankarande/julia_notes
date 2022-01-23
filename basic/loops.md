```julia
i = 1
while i <= 5
    @show i
    i += 1
end
```

```julia
# for is used to loop over iterable object.
for i = 1:5 # =
    @show i
end

for i in 1:5 # in 
    @show i 
end

# = or in can be used.. both mean the same thing here.. 

```

```julia
persons = Dict("Alice" => 10, "Bob" => 23, "Carla" => 14, "Daniel" => 34);

for (name, age) in persons
    println("Hi, my name is $name and I am $age old.")
end

for pair in persons
    println(pair.first, pair.second, pair[1], pair[2])
end

```

### Nested 
```julia
for i in 1:3
    for j in i:3
        @show (i, j)
    end
end

for i in 1:3, j in i:3
    @show (i,j)
end
```
