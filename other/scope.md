```julia
s = 0
for i = 1:10
    t = 1 + i # new local variable t
    s = t # new local variable s and warning ... The assignment in the soft scope is ambiguous, and a new local variable is created.
end
```

```julia
# Proper way if you want to create a local variable with the same name
s = 0
for i = 1:10
    t = 1 + i # new local variable t
    local s = t # assigning a new value to the local variable
end
```

```julia
# Proper way if you want to assign a new value to global variable in a block
s = 0
for i = 1:10
    t = 1 + i # new local variable t
    global s = t # assigning a new value to the local variable
end
```
