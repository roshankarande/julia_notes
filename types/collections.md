#  collections

```julia
k = 1:10
k = range(1,10)
# k = range(1,10; step = 1, length = 100) ... step to decide the step side.. length to specify how many points.. step is calculated accordinly.. either specify step or length (not both)
 
minimum(k) 
maximum(k) # like maximum([4,5,3])
extrema(k)  # both the minimum and maxium
max(k...)  # like max(4, 5, 3)

sum(k)

f(x) = x^2
x = 1:100
sum(f,x)  # sum of squares of x, # sum(f, itr; [init]) 

length(k)
prod(k)     # for product

reduce(min, k) # find the min of k == min(min(1,2),3) ... and so on
reduce(f, k) # apply function f to perform reductions

repeat("abc", 3) # "abcabcabc"
repeat(1:4, inner = 2) # [1, 1, 2, 2, 3, 3, 4, 4]
unique([1, 1, 2, 2, 3, 3, 4, 4])
allunique(itr) -> Bool # returns true if all the elements are unique
```


```julia
argmax([8, 0.1, -9, pi])  # returns 1
argmin([8, 0.1, -9, pi])  # returns 3

all(itr)  # Test if all elements of bool collection are true, return false if a false value is present
all(p,itr) # p is predicate  x ->  1 < x < 3
a = [true,false,false,true]
all(a)  # false
findall(x -> x == 1, [1,1,2,3,1,2,4,5,6]) # returns the index where true in collection # [1, 2, 5]



any(itr)  # true if even one element is true in bool collection
any(p,itr) #  p is predicate  x ->  1 < x < 3
any([true, false,false]) # true
any(i->(4<i<6), [3,5,7]) # true
```

```julia
merge(u,v) # merge two collections .. also can merge two dictionaries .. if common keys... values of v will take precedence
merge(u,v) # results stored in u of merge u, v ... 
sort(v)
sort(v, rev=true) # reverse sorting
sort(d, byvalue=true) # to sort a dictionary d by value 

sort!(v) # sort in place # 
sort(A,dims)   # matrix sorting 
sort!(A,dims)   # matrix sorting in place

sortperm(v) # returns the permutation that will sort v
sortperm!(v)
reverse(v)

s = sort(v alg=QuickSort) # alg=InsertionSort, MergeSort 
ps = sort(v; alg=PartialQuickSort(k)) # only upto index k

sortslices([7 3 5; -1 6 4; 9 -2 8], dims=1) # Sort each row
sortslices([7 3 5; -1 6 4; 9 -2 8], dims=1,rev = true) # Sort each row in reverse order

issorted(v) # true if it is sorted
issorted([(1, "b"), (2, "a")], by = x -> x[1]) # true
issorted([(1, "b"), (2, "a")], by = x -> x[2], rev=true) # true

 v = [3, 1, 2, 1];
partialsortperm(v, 2) # 4 # returns the index of element in v, which will be at kth(2) index in sorted v
partialsortperm(v, 1:3) # [2,4,3] # returns the index of elements in v, s.t. they will be first 3 in sorted v
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
first(eachrow(a))   # [1,2]
sum.(eachrow(a)) # [3,6]

#Create a generator that iterates over the second dimension of matrix A
first(eachcol(a))  # [1, 3]
sum.(eachcol(a))
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

### Map

 Transform collection c by applying f to each element. For multiple collection arguments, apply f elementwise, and stop when when any of them is exhausted.

```julia
map(x -> x^2 + 2x - 1, [1,3,-1]) 


```

### Flatten

```julia

v = [1,2,3,[2,3,[4,5]]]

# flattening 1 level only
collect(Iterators.flatten(v))
# 6-element Vector{Any}: 
#  1
#  2
#  3
#  2
#  3
#  [4, 5]

vcat(v...) # same as Iterators.flatten

# flattening deep structures
function flatten(arr)
   rst = Any[]
   grep(v) =   for x in v
               if isa(x, Tuple) ||  isa(x, Array)
               grep(x)
               else push!(rst, x) end
               end
   grep(arr)
   rst
end

flatten(arr) # [1, 2, 3, 2, 3, 4,5]
```