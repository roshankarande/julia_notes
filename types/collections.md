#  collections

```julia
    k = 1:10
    minimum(k) 
    maximum(k)
    sum(k)
    length(k)
    prod(k)     # for produt
```


```julia
argmax([8, 0.1, -9, pi])  # returns 1
argmin([8, 0.1, -9, pi])  # returns 3

```

### Resize
Resize collection to contain n elements. If n is smaller than the current collection length, the first n elements will be retained. If n is larger, the new elements are not guaranteed to be initialized.

```
resize!(collection, n) -> collection
```

### Collect
The collect() is an inbuilt function in julia which is used to return an array of all items in the specified collection or iterator.

```
collect(1:5:10)
```

