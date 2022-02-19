```julia
]
pin CSV@0.8.5
# looks like newer version is breaking... with Julia 1.
# This is fixed.. I think
```

```julia
using CSV

file = CSV.File("data.csv")

CSV.read(file) # CSV.read("data.csv")   # DataFrame(CSV.read(file))
table = CSV.read("dataframe.csv", DataFrame; header = true)

CSV.write("a.csv", a) # a is some dataframe 
a |> CSV.write("a.csv") # another way
```

```julia
data = """
a,b,c
# first row
1,2,3

4,5,6
"""

# "a" and "c" that we want to include or keep from parsing
# just read 2 rows
file = CSV.File(IOBuffer(data); select=[1, 3], limit = 2, comment="#", ignoreemptyrows=true) # or [:a :c] or ["a", "c"] instead of [1, 3]

# we'd like to drop/exclude from parsing
file = CSV.File(IOBuffer(data); drop=[2], comment="#", ignoreemptyrows=true) # [:b] # ["b"]

data = """
col1    col2 col3
123431  2    3421
2355    346  7543
"""
# for specifying a different delimiter
file = CSV.File(IOBuffer(data); delim=' ', ignorerepeated=true)
```


## No Header
```julia
data = """
1.0 0.0 0.0
0.0 1.0 0.0
0.0 0.0 1.0
"""

file = CSV.File(IOBuffer(data); header=false, delim=' ', types=Float64) # all types are Float64

```

## Specify Types
```julia
data = """
col1,col2,col3
1,2,3
4,5,invalid
6,7,8
"""

# we will see warnings
file = CSV.File(IOBuffer(data); types=Dict(3 => Int)) # Dict(:col3 => Int)) or Dict("col3" => Int))

file = CSV.File(IOBuffer(data); types=[Int, Int, Int]) # same as types = Int

# warnings will be ignored
file = CSV.File(IOBuffer(data); types=[Int, Int, Int], silencewarnings=true)

# we will get an error
file = CSV.File(IOBuffer(data); types=[Int, Int, Int], strict=true)
```