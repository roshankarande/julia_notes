```julia
using DataFrames
df = DataFrame(A = 1:4, B = ["M", "F", "F", "M"], C = rand(4))

df.A or df[!,:A] or df[!,1] or df[!, "A"]

df[!, :A] # references to original df column... changing some value will reflect change in df
df[:, :A] # creates a copy... chaning value in this won't reflect in df

df[:,:] , df[!,:] ,  df # to access  the entire stuff 

```

## Adding columns or rows

```julia
# It is common for tables to be created column by column or row by row. DataFrames provides an easy way to extend existing tables
df.D = [:a, :b, :c, :d] # column D is added to df
df[!,:D] = [:a, :b, :c, :d] # column D is added to df or of df[!,"D"] or df[!,4]

insertcols!(df, 3, :B => rand(4), :B => 11:14; makeunique = true) # will add B1 and B2 (as B is already there.. hence B1,B2) between .. B1 will be col3 and B2 will be col4..

# rows can be added this way
push!(df, [10, "F", 0.1, 15, 0.235, :f])
push!(df, (10, "F", 0.1, 15, 0.235, :f))
push!(df, Dict(:B_1 => 0.1, :B_2 => 15, :A => 10, :D => :f, :B => "F", :C => 0.235))
df
```

## Incrementally Creating DataFrames

```julia

# Columwise addition
df = DataFrame()
df.A = 1:3
df.B = [:a, :b, :c]
df

# For row-wise addition
df = DataFrame(A = Int[], B = Symbol[]) # you will have to add headers
push!(df, [1, :a])
push!(df, [2, :b])
push!(df, [3, :c])

names(df)  #   "A" "B" # names of the columns of dataframes
rename!(df, [:a, :b, :c, :d, :e, :f]) # to rename all the columns at once
rename!(df, Dict(:i => "A", :x => "X")) # rename particular columns

```

```julia
using RDatasets, DataFrames
iris = dataset("datasets", "iris")
first(iris, 6) # last(iris, 6)
describe(iris)    # For a Brief Description ... basic stats per column

#!!NOTE that df[!, [:A]] and df[:, [:A]] return a DataFrame object, while df[!, :A] and df[:, :A] return a vector:
iris[2:4, [:SepalLength, :Species]]  # accessing a particular subset

# Additionally, DataFrames provides Not, Between, Cols and All selectors for more complex column selection scenarios.
iris[2:4, Not([:SepalLength, :Species])]
iris[:, Cols(x -> startswith(x, "S"))]
iris[:, Cols(:,r"P")] # all the cols that match the regex P moved to end
iris[:, Cols(r"P",:)] # all the cols that match the regex P moved to start
iris[:, Cols(Not(r"P"), :)] # cols not matching regex moved to start
iris[iris.SepalLength .> 5 , :] # all cols for rows that have SepalLength>5

# df[(df.A .> 500) .& (300 .< df.C .< 400), :]
# same as  @. df[(df.A > 500) & (300 < df.C < 400), :]

```


```julia
@chain
@subset
@rsubset
@orderby
@combine
@groupby  # split-apply-combine
@transform


```

https://dataframes.juliadata.org/stable/man/querying_frameworks/#DataFramesMeta.jl


https://juliadata.github.io/DataFramesMeta.jl/stable/dplyr/
