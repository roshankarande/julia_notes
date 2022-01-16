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

all(itr)  # Test if all elements of bool collection are true, return false if a false value is present
all(p,itr) # p is predicate  x ->  1 < x < 3
a = [true,false,false,true]
all(a)  # false


any(itr)  # true if even one element is true in bool collection
any(p,itr) #  p is predicate  x ->  1 < x < 3
any([true, false,false]) # true
any(i->(4<i<6), [3,5,7]) # true
```

```julia
for (i, val) in enumerate(A)
    println("i = $(i) and A[i] = $(val)")
end
```

### eachrow, eachcol
```julia
 # Create a generator that iterates over the first dimension of vector or matrix A
a = [1 2; 3 4]
first(eachrow(a)) [1,2]


#Create a generator that iterates over the second dimension of matrix A
first(eachcol(a)) = [1, 3]
```

### zip
```julia

# In this case, the iterable objects were of different lengths. The iterator returned by the zip function will have the same length as the shortest of its inputs.
for (i, j, k) in zip([1, 4, 2, 5], 2:12, (:a, :b, :c))
    @show (i, j, k)
end
# (i, j, k) = (1, 2, :a)
# (i, j, k) = (4, 3, :b)
# (i, j, k) = (2, 4, :c)

```


### resize
Resize collection to contain n elements. If n is smaller than the current collection length, the first n elements will be retained. If n is larger, the new elements are not guaranteed to be initialized.

```
resize!(collection, n) -> collection
```

### Collect
The collect() is an inbuilt function in julia which is used to return an array of all items in the specified collection or iterator.

```
collect(1:5:10)
```

