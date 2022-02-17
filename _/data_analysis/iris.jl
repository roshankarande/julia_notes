
# using RDatasets
using DataFrames
using VegaDatasets, DataVoyager, VegaLite

# Hello world of Data Analysis

# iris = RDatasets.dataset("datasets","iris")

data = DataFrame(dataset("iris"))

typeof(data)
describe(data)

# Visualize the dataset
#  this will only work in vscode ... the columns have filters in them.. and can be sorted etc... 
# vscodedisplay(data)

v = Voyager(data)

# assign the plot to a variable
p = v[]

# both the methods work
p |> save("./iris_voyager.png")
save("iris_voyager.svg", p)
