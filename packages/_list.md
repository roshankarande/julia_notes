# Other packages

* Test
* SparseArrays
* Distributed
* StaticArrays
* Symbolics
* IntervalArithmetic 
* DataFramesMeta  * # prefer this one over Query .. both are good*
* Query https://github.com/queryverse/Query.jl
* Roots # for finding the roots of a polynomial
* PackageCompiler.jl
* Luxor.jl
* https://github.com/JuliaStats/Distances.jl  [Nice!!]
* Transducers.jl
* Floops.jl
* Latexify -> for latex support
* https://github.com/JuliaIO/JLD2.jl 
* Traceur # Profiling
* https://github.com/BioJulia/Automa.jl   # finite state machine
* JUMP.jl # Optimization Softwares... best!

## Other

* https://github.com/tkf/ThreadsX.jl
https://discourse.julialang.org/t/numerical-integration-over-given-integral-how-to-do-it-in-julia/14267   # integration
https://docs.juliahub.com/SymPy/KzewI/1.0.28/Tutorial/calculus/#Integrals-1 - SymPy.jl

## Finance 

MarketTechnicals.jl - For financial time series technical analysis.
FinancialDerivatives.jl - For financial derivatives modelling and pricing
QuantLib.jl - Aims to provide a Julia version of QuantLib written in C++.
QuantEcon.jl - For quantitative economics
Jib.jl - Julia implementation of Interactive Brokers API
Quandl.jl - For data from Quandl
YStockData.jl - For data from Yahoo Finance
TradingLogic.jl - For backtesting and live trading


```julia
using Roots
f(x) =  x^5 - x + 1/2

find_zero(f, 0.6) # find zero root near 0.6
find_zero(f, (-1.2,  -1))  # -1.0983313019186336... find zeros in [-1.2 -1]

julia> find_zeros(f, -5,  5)  # find zeros in [-5 5]
3-element Vector{Float64}: #  [-1.0983313019186334, 0.550606579334135,  0.7690997031778959 ]
```

### JLD2 to save variables from julia to file 

```julia
jldsave("./data/random/file.jld2"; idx, dst) 
jldsave("./data/random/file.jld2"; index = idx, distance = dst) 
save("./data/random/file.jld2",Dict("index" => idx, "distance" => dst)) # this and above one are the same
result = load("./data/random/file.jld2") # result is a dictionary
result["index"]
```

### Distances.jl 
https://github.com/JuliaStats/Distances.jl

```julia
x = rand(3,3)
y = rand(3,3)

res = [norm(x[:,i] - y[:,j]) for i in 1:3, j in 1:3]
res1 = pairwise(Euclidean(), x, y) # this and res1 are the same ... the distances are columnwise pairwise .. if it is a matrix else they are elementwise in vectors .

pairwise(Euclidean(), [1,2,3],[1,1,0])
# 3×3 Matrix{Float64}:
#  0.0  0.0  1.0
#  1.0  1.0  2.0
#  2.0  2.0  3.0

u,v = [1,2,3],[1,1,0] ; 
[norm(u[i] - v[j]) for i in 1:3, j in 1:3]
# 3×3 Matrix{Float64}:
#  0.0  0.0  1.0
#  1.0  1.0  2.0
#  2.0  2.0  3.0

```