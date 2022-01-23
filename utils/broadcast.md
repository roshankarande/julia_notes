```julia

@. # automatically adds a dot before each operator and each function



v = 1:5
v.^2  # element wise square
sin.(v)  # or broadcast(sin, v) ... broadcast is a function that does same as . 


```

The dot syntax allows us to operate on multiple arrays even of different shapes. The following example takes a column vector and a row vector, broadcasts them into the matrix (the smallest superset of both vectors) and then performs the sum.

```julia
x = [1,2,3,4] # column vector
y = [1 2 3 4] # row vector
x .+ y
# 4×4 Matrix{Int64}:
#  2  3  4  5
#  3  4  5  6
#  4  5  6  7
#  5  6  7  8
```

Similarly, it can be used to broadcast a scalar to a vector in the following examples.

```julia
x .+ 1 # [2,3,4,5]
```

## Composition

```julia
# ∘ - > \circ tab
(sqrt ∘ +)(3, 6) # equivalent to sqrt(3 + 6)
(sqrt ∘ abs ∘ sum)([-3, -6, -7]) # 4

```

## Piping
Piping or using a pipe is another concept of chain functions. It can be used to pass the output of one function as an input to another one. In Julia, it can be done by the pipe operator |>.

```julia
[-3, -6, -7] |> abs |> sum |> sqrt # 4

 # The pipe operator can be combined with broadcasting.
[-4, 9, -16] .|> abs .|> sqrt # [2,3,4]

#we can use broadcasting in combination with the pipe operator to apply a different function to each element of the given vector
["a", "list", "of", "strings"] .|> [uppercase, reverse, titlecase, length]  # ["A", "tsil", "Of", 7]

```

