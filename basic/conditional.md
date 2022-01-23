```julia
    x, y = 3, 4

    if x < y
        println("x is less than y")
    elseif x > y
        println("x is greater than y")
    else
        println("x is equal to y")
    end
```

```julia
    x, y = 2, 1
    msg = x < y ? "x is less than y" : "x is greater than or equal to y"
    println(msg)
```
