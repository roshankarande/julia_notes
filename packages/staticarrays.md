https://juliaarrays.github.io/StaticArrays.jl/stable/pages/api/#Guide

SArray - Immutable, Stack Allocated, 14x14 limit preferred
MArray - Mutable, Stack Allocated, 14x14 limit prefererred
SizedArray - No limitations, mutable, Stack Allocated...


```julia
# Use static arrays till size is less than 14*14

A = rand(10,10); B = rand(10,10);

julia> @btime $A*$B;  #   321.728 ns (1 allocation: 896 bytes)
## $ would do static array operation and A will do normal operation

using StaticArrays 
A = @SMatrix rand(10,10);
B = @SMatrix rand(10,10);

@btime $A*$B          #  65.206 ns (0 allocations: 0 bytes)

# If they are larger, probably calling in place mul! will be a good alternative:

using LinearAlgebra
A = rand(1000,1000); B = rand(1000,1000); C = similar(A);
@btime $A*$B;  #  18.840 ms (2 allocations: 7.63 MiB)
@btime LinearAlgebra.mul!($C,$A,$B) # 18.650 ms (0 allocations: 0 bytes)

@SVector [1,2,3]; @SVector Float64[1,2,3]


v = [1,2]

m = [1 2;
     3 4]

# ... a lot of intervening code

sv = SVector{2}(v)
sm = SMatrix{2,2}(m)
sa = SArray{Tuple{2,2}}(m)

sized_v = SizedVector{2}(v)
sized_m = SizedMatrix{2,2}(m)

```