#=
    Packages for this tutorial:
        CSV v0.8.3
        DataFrames v0.22.5
        PrettyTables v0.11.1
        TypedTables v1.2.3
=#

################################################################################

## Tables.jl is the glue for DataFrames, TypedTables etc. but it is for Package Developers... 

################################################################################
# Matrix
################################################################################

using CSV, DataFrames, PrettyTables, TypedTables

brand = ["Company A", "Company A", "Company A"]
tier = ["Premium", "Economy", "Standard"]
quantity = [10, 100, 50]
price = [100, 10, 50]
cost = [30, 7, 25]

# 1. Create Matrix
mymatrix = [brand tier quantity price cost]

# select the price column
myprice = mymatrix[:, 4]

# select the Economy row
myeconomy = mymatrix[2, :]

# 2a. calculate Revenue
myquantity = mymatrix[:, 3]
myrevenue = myquantity .* myprice

# add Revenue Vector to Matrix
mymatrix = [mymatrix myrevenue]

# 2b. calculate Profit
mycost = mymatrix[:, 5]
myprofit = myquantity .* (myprice .- mycost)

# add Profit Vector to Matrix
mymatrix = [mymatrix myprofit]

# 2c. calculate Profit Margin
mymargin = myprofit ./ myrevenue

# add Profit Margin Vector to Matrix
mymatrix = [mymatrix mymargin]

# 3. calculate totals for Quantity, Revenue and Profit
mytotalquantity = sum(myquantity)
mytotalrevenue = sum(myrevenue)
mytotalprofit = sum(myprofit)

# 4. calculate overall Profit Margin
mytotalmargin = mytotalprofit / mytotalrevenue

# 5. create a new Matrix for totals
metrics = ["Quantity", "Revenue", "Profit", "Margin"]
totals = [mytotalquantity, mytotalrevenue, mytotalprofit, mytotalmargin]
mytotalsmatrix = [metrics totals]

# view Matrix
mymatrix

# save Matrix as a CSV File
# using DelimitedFiles
# writedlm("mymatrix.csv", mymatrix, ',')


################################################################################
# DataFrames
################################################################################

using DataFrames

# convert Table into DataFrame

mydataframe = DataFrame(mytable)

# 1. Create DataFrame

df = DataFrame(
    Brand = brand,
    Tier = tier,
    Quantity = quantity,
    Price = price,
    Cost = cost
)

# 2a. calculate Revenue
df.Revenue = df.Quantity .* df.Price
df

# 2b. calculate Profit
@. df.Profit = df.Quantity * (df.Price - df.Cost)
df

# 2c. calculate Profit Margin
df.Margin = df.Profit ./ df.Revenue

# 3. calculate totals for Quantity, Revenue and Profit
dftotalquantity = sum(df.Quantity)
dftotalrevenue = sum(df.Revenue)
dftotalprofit = sum(df.Profit)

# 4. calculate overall Profit Margin
dftotalmargin = dftotalprofit / dftotalrevenue

# 5. create a new DataFrame for totals
dftotals = DataFrame(
    Quantity = dftotalquantity,
    Revenue = dftotalrevenue,
    Profit = dftotalprofit,
    Margin = dftotalmargin
)

mytotalsmatrix

# Display stuff
# vscodedisplay(df)

# CSV.write("mydf.csv", df)
# savehtml("mydf", df)


# summary info
describe(df)
nrow(df)
ncol(df)
size(df)

# column name functions
names(df)
propertynames(df)
rename(df, :Brand => :Company)

rename!(df, :Quantity => :Qty)

rename!(df, :Qty => :Quantity)

# how to index a DataFrame

# how to index entire column

mycolumn = df.Revenue

# how to index entire row

myrow = df[3, :]

# index individual element

mysubset = df.Tier[1]

# taking a subset

mysubset = df.Revenue[2:3]
mysubset = df[2:3, :]
mysubset = df[:, [:Tier, :Revenue]]
mysubset = df[2:3, [:Tier, :Revenue]]


