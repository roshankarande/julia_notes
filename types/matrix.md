https://docs.julialang.org/en/v1/manual/arrays/

### dims argument ->
- 1 == first dimension is changing (rows changing, column fixed).. ie. "columnwise operation"
- 2 == second dimension is changing ... i.e. "row wise operation"

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

M[:,1:end .!= 3] # all columns except the third one


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
zeros(T,dims) # zeros(3,4)  or zeros(Int8,(3,4)) # default type is Float64 
ones(T,dims) # 
Matrix(I, 3,3) # using LinearAlgebra .. Identity Matrix of 3x3
Matrix(undef, 3,4) # matrix of undefs 3x4
fill(x,dims) # x filled object of given dimensions will be created

rand(T,dims)
randn(T, dims)

# using Random
randperm(4) # random permutation of given length some permutation of [1,2,3,4]
shuffle([1,2,3,4]) # randomly shuffles 

copy(A)
deepcopy(A) # recursive copy
similar(A) # an uninitialized array of the same type as A and same dimensions
```

```julia

Array{Float64, 2}(undef, 2, 3) # 2x3 matrix with random entries 

A = rand(3,4)
A .= 1 # element wise assignment
A .-= 5

A .> .4 # element wise comparison ... returns the indices of 1's and 0's
A[A .> .4] # get the elements in A where that condition is met i.e. aij > .4

count(<=(2), A, dims=1) # Count the number of elements in A for which expression returns true over the given dimensions.
count(==(2), A, dims=1) # Count the number of elements equal to 2 column wise

first(eachcol(a))  # first element per column
sum.(eachcol(a))   # sum of element columnwise

reduce(max, A, dims=2) # find the max row wise.. i.e. when row fixed and column changes

B = zeros(4,4)
B = ones(3,4)
B = fill(4, 5,5) # create a 5x5 matrix with all entries 4
B = Matrix(I, 4, 4) # create a 4x4 identity matrix 


A.*B  # elementwise multiplication

A' # hermitian of A. (which is transpose of A if A has real values)
conj(transpose(A)) == A' # true

inv(A) == A^-1 # Inverse of A
pinv(A) # pseudo inverse of A
det(A) # determinant of A


rank(A) # rank of matrix A
val, vec = eigen(A) # using Linear Algebra
eigvals(A), eigvecs(A) # LinearAlgebra
norm(A,p) # p norm of A .. by default is 2



Diagonal([1,2,3]) # diagonal matrix


isposdef(rand(4,4)) # checks if a matrix is positive semidef ... note the matrix has to be symmetric
# A = [1 2; 0 1]; isposdef(A) ## false
```

```julia
A = rand(4,4)
qr(A)
lu(A)
eigen(A) # only true if the matrix is diagonalizable

cholesky(A) # only if the matrix is hermitian or symmetric .. is an efficient way to check if a matrix is PSD or not


```

```julia

julia> A = rand(4,3);

julia> F = svd(A); # Store the Factorization Object  # F has U,S,Vt and V

julia> A ≈ F.U * Diagonal(F.S) * F.Vt
true

julia> U, S, V = F; # destructuring via iteration # deconstructing F gives V... and not Vt

julia> A ≈ U * Diagonal(S) * V'
true

```


## Broadcasting

```julia
A = [1 2; 3 4]
A .+ 1 # [2 3; 4 5]

C = [1 2]
A .+ C # [2  4;  4  6]
```