https://docs.julialang.org/en/v1/manual/arrays/

```julia
M = [1  2  3  4; 5  6  7  8]
row,col = size(M)  # row -> 2, col -> 4
length(M) # 8
ndims(M) # 2

M[end-1] # 4 as matrices are stored in Julia in column major format
M[1,4]  # 4 
M[1:end,1:2:end]
M[1,:] # all the columns of first row
M[:] # all the elements as a vector


```

### Concatenation

```julia
# Both are Horizontal concatenation
hcat(M,M) 
[M  M]

# Both are vertical concatenation
vcat(M,M)
[M; M]
```

```julia
z = [1,2,3] # vector
z = [1;2;3] # vector .. for single element it essential is a vector ... but if you have 1 2 ; 2 3 then it is matrix
reshape(z,(3,1)) # 3x1 matrix .... reshape(z,3,1) or reshape(z,(:,1)) or z[:,:]
z = [1 2 3;] # 1x3 matrix
```


```julia
zeros(T,dims) # zeros(3,4)  or zeros(Int8,(3,4))# default type is Float64 
ones(T,dims) # 
fill(x,dims) # x filled object of given dimensions will be created

rand(T,dims)
randn(T, dims)

copy(A)
deepcopy(A) # recursive copy
similar(A) # an uninitialized array of the same type as A and same dimensions
```

```julia
A = rand(3,4)
A .= 1 # element wise assignment
A .-= 5

B = ones(3,4)

A.*B  # elementwise multiplication

A' # transpose of A


```

