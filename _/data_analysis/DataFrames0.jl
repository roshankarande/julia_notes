using CSV, HTTP, Statistics
using DataFrames, DataFramesMeta

url = "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
msleep = CSV.read(HTTP.get(url).body, DataFrame; missingstring = "NA")

size(msleep)
names(msleep)
describe(msleep)

#### for rX operations you don't need broadcasting when compared to X operation... @rsubset vs @rsubset

### @select
@select msleep :name :sleep_total
@select msleep :name :3   # :name column and column at index 3
varnames = ["name", "sleep_total"]
@select msleep $varnames
@select msleep $(Not(:name))
@select msleep $(r"^sl")

# You can use the boolean operators (e.g. >, <, >=, <=, !=, in) to create the logical tests.
@rsubset msleep :sleep_total > 16 && :awake > 6.0
@rsubset msleep :sleep_total > 16 || :awake > 6.0

## This means it is an AND operation
@rsubset msleep begin
    :sleep_total >= 16
    :bodywt >= 1
end

let
    relevant_orders = Set(["Perissodactyla", "Primates"])
    @rsubset msleep :order in relevant_orders
end

### @with
# @with creates a scope in which all symbols that appear are aliases for the columns in a DataFrame.

x = @with df begin
    res = 0.0
    for i in 1:length(:x)
        res += :x[i] * :y[i]
    end
    res
end

### @eachrow and @eachrow!
# Act on each row of a data frame. Includes support for control flow and begin end blocks.
# No need to use broadcasting as it is by row by default...
df = DataFrame(A = 1:3, B = [2, 1, 2])
df2 = @eachrow df begin
    :A = :B + 1
end


### @chain

# If you use subset then you have to use broadcasting
d1 = @chain msleep begin
    # select(:name,:sleep_total)
    @select :name :sleep_total
    @subset :sleep_total .> 16
end

d2 = @chain msleep begin
    @select :name :sleep_total
    @rsubset :sleep_total > 16
end

d1 == d2


@chain msleep begin
    @select :name :order :sleep_total
    @orderby :sleep_total
    @rsubset :sleep_total > 16
    # first(5)
end


# Same as above just that :sleep_total is in reverse order
@chain msleep begin
    @select :name :order :sleep_total
    @orderby begin
        :order
        sortperm(:sleep_total, rev = true)
    end
    @rsubset :sleep_total >= 16
end


### @transform and @rtransform

# Create a new column called :rem_proportion, which is the ratio of rem sleep to total amount of sleep
@rtransform msleep :rem_proportion = :sleep_rem / :sleep_total
@transform msleep :rem_proportion = :sleep_rem ./ :sleep_total

### @combine
# The @combine macro will create summary statistics for a given column in the data frame, such as finding 
# the mean. 

# For example, to compute the average number of hours of sleep, apply the mean function to the column :sleep_total 
# and call the summary value :avg_sleep.

@chain msleep @combine :avg_sleep = mean(:sleep_total)

@combine msleep begin
    :avg_sleep = mean(:sleep_total)
    :min_sleep = minimum(:sleep_total)
    :max_sleep = maximum(:sleep_total)
    :total = length(:sleep_total)
end

### groupby ..

# The groupby verb is an important function in DataFrames.jl (it does not live in DataFramesMeta.jl).
#  it's related to concept of "split-apply-combine". We literally want to split the data frame by some variable (e.g. taxonomic order),
# apply a function to the individual data frames and then combine the output.

@chain msleep begin
    groupby(:order)
    @combine begin
        :avg_sleep = mean(:sleep_total)
        :min_sleep = minimum(:sleep_total)
        :max_sleep = maximum(:sleep_total)
        :total = length(:sleep_total)
    end
end

# Split-apply-combine can also be used with @transform to add new variables to a data frame by performing operations by group. For instance,
# we can de-mean the total hours of sleep of an animal relative to other animals in the same genus.

@chain msleep begin
    groupby(:order)
    @rtransform :sleep_genus = :sleep_total - mean(:sleep_total)
    first(10)
end