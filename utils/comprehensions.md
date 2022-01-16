

### Note

```julia
B = [   -1  0  2;   2  -3  1 ]
A1 = 1/2 *[ exp((B[i,j] + 1)^2) for i ∈ 1:2, j ∈ 1:3 ]   # this will create a 2x3 matrix
A2 = 1/2 *[ exp((B[i,j] + 1)^2) for i ∈ 1:2 for j ∈ 1:3 ] # this will create a 6 element vector 
# If a vector is created row-wise of elements of A1, it will be same as A2

A3 = exp.((B .+ 1) .^ 2) ./ 2
A4 = @. 1/2*exp((B + 1) ^ 2)  # @. macro automatically adds a dot before each operator and each function

```