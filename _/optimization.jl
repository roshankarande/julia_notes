using Plots # also a high level interface
using JuMP # Julia for Mathematical programming
using GLPK
# Mathematical Programming == related to Optimization
# Enables you to use common syntax to access various solvers

# Julia has interfaces for ... various solvers
# GLPK -> linear optimization solver
# Ipopt -> Nonlinear solver
 
model = Model(GLPK.Optimizer)
@variable(model, x >= 0)
@variable(model, 0 <= y <= 3)
@objective(model, Min, 12x + 20y)
@constraint(model, c1, 6x + 8y >= 100)
@constraint(model, c2, 7x + 12y >= 120)

print(model)
optimize!(model)

# @show termination_status(model)
# @show primal_status(model)
# @show dual_status(model)
@show objective_value(model)
@show value(x)
@show value(y)
# @show shadow_price(c1)
# @show shadow_price(c2)


# ---------------------------------
# -------- General Template -------

# 1. Describe Situation
# 2. Add Packages
# 3. Select Model
# 4. Define Variables
# 5. Set Objective
# 6. Define Constraints
# 7. Run Solver
# 8. Display Results
# 9. Report Conclusion in words

# ---------------------------------
# Example 2: Knapsack Problem from Wikipedia (binary)

# Describe Situation
#=
    Pack the most valuable boxes without overloading the luggage.
    Assume only 1 box of each color is available.
=#

# Select Packages

# using JuMP
# using GLPK

# Select Model

model = Model(GLPK.Optimizer)

# Define Variables

@variable(model, green, Bin) # binary .. so it can be either 1 or 0  
@variable(model, blue, Bin)  # If you want only Integer values >=0 use  @variable(model,blue >=0 , Int)
@variable(model, orange, Bin)
@variable(model, yellow, Bin)
@variable(model, gray, Bin)

# Define Constraints
# total weight in kilograms must be less than or equal to 15

@constraint(model, weight,
    green * 12 + blue * 2 + orange * 1 + yellow * 4 + gray * 1 <= 15
)


# Set Objective
# given the weight constraint, select the boxes that maximize
# the dollar value

@objective(model, Max,
    green * 4 + blue * 2 + orange * 1 + yellow * 10 + gray * 2
)

# Run Solver

optimize!(model)

# Display Results

boxes = [green, blue, orange, yellow, gray]

for box in boxes
    println(box, "\t =", value(box))
end

value(weight)

objective_value(model)

# Report Conclusion
#=
    A Maximum Dollar value of $15 can be achieved by taking every box,
    except for the Green box, assuming there is only 1 box of each color.
=#

# Example 3: Knapsack Problem from Wikipedia (infinite supply)

# Describe Situation
#=
    Pack the most valuable boxes without overloading the luggage.
    Assume an infinite supply of boxes of each color is available.
=#

model = Model(GLPK.Optimizer)
@variable(model, green >= 0, Int) # integer
@variable(model, blue >= 0, Int)
@variable(model, orange >= 0, Int)
@variable(model, yellow >= 0, Int)
@variable(model, gray >= 0, Int)

@constraint(model, weight,
    green * 12 + blue * 2 + orange * 1 + yellow * 4 + gray * 1 <= 15
)


@objective(model, Max,
    green * 4 + blue * 2 + orange * 1 + yellow * 10 + gray * 2
)

optimize!(model)

boxes = [green, blue, orange, yellow, gray]

for box in boxes
    println(box, "\t =", value(box))
end

value(weight)

objective_value(model)

# Report Conclusion
#=
    A Maximum Dollar value of $36 can be achieved by taking 3 Yellow boxes,
    and 3 Gray boxes, assuming an infinite supply of boxes of each color.
=#

################################################################################

# Nonlinear Examples

# Example 4: Maximize area of yard

# Describe Situation
#=
    Given 100 feet of total fencing material, enclose a rectangular yard
    along a stone wall, using 3 sides of fencing, that maximizes the area
    of that yard.
=#

# Select Packages

# using JuMP
using Ipopt

model = Model(Ipopt.Optimizer)

# start is optional
@variable(model, x >= 0, start = 0)
@variable(model, y >= 0, start = 0)

# also works with @constraint  and @objective
@NLconstraint(model, x + 2y == 100)
@NLobjective(model, Max, x * y)

optimize!(model)

@show value(x) value(y);
objective_value(model)

# Report Conclusion
#=
    The Maximum area is 1250 square feet, which is achieved by having
    the 2 side fences equal to 25 feet each and the third side equal 50 feet.
=#

# Visualize Conclusion (for nonlinear)

# select Frontend and Backend

using Plots
plotlyjs(size = (760, 570))

# select variable range for the x-axis

x = 0:100

# select objective function to plot along y-axis

area(x) = x * (100 - x) / 2 # x * y

# generate plot

p = plot(x, area,
    title = "Maximize Area",
    xlabel = "Length of x (feet)",
    ylabel = "Area (square feet)"
)

# save plot

savefig(p, "max_area.svg")

# Example 5: Minimize Travel Time

# Describe Situation
#=
    There is a race that involves running East on the beach and swimming
    North to an island. Measuring along the beach, a racer would have
    to run 6 miles to be directly South of the island. The island is 2 miles
    North of that point on the beach. The racer can run at 8 mph and can
    swim at 3 mph. The racer can enter the water at any point on the beach
    to begin swimming to the island. At what point should the racer enter
    the water in order to Minimize the total travel time to the island?
=#

# Select Packages

# using JuMP
# using Ipopt

# Select Model

model = Model(Ipopt.Optimizer)

# Define Variables

@variable(model, 0 <= x <= 6, start = 0)

# Define Constraints

# none

# Set Objective

@NLobjective(model, Min, x / 8 + sqrt((6 - x)^2 + 2^2) / 3)

# Run Solver

optimize!(model)

# Display Results

value(x)

objective_value(model)

# Report Conclusion
#=
    The Minimum time it would take a racer to reach the island is
    1.37 hours, which can be achieved by running 5.19 miles along
    the beach before entering the water to swim to the island.
=#

# Visualize Conclusion (for nonlinear)

# select Frontend and Backend

# using Plots
# plotlyjs(size = (760, 570))

# select variable range for the x-axis

x = 0:0.01:6

# select objective function to plot along y-axis

time(x) = x / 8 + sqrt((6 - x)^2 + 2^2) / 3

# generate plot

p = plot(x, time,
    title = "Minimize Travel Time",
    xlabel = "Distance (miles)",
    ylabel = "Time (hours)"
)

# save plot

savefig(p, "min_time.svg")

# Example 6: Maximize Revenue

# Describe Situation
#=
    A car rental company charges anywhere from $50 per day to $200
    per day. The Demand Curve for their cars is Q(P) = 1000 - 5P.
    What price should they charge in order to Maximize their Revenue?
=#

# Select Packages

# using JuMP
# using Ipopt

# Select Model

model = Model(Ipopt.Optimizer)

# Define Variables

@variable(model, 50 <= P <= 200, start = 50)

# Define Constraints

# none

# Set Objective

@NLobjective(model, Max, P * (1000 - 5P)) # Revenue = P * Q

# Run Solver

optimize!(model)

# Display Results

value(P)

objective_value(model)

# Report Conclusion
#=
    A Maximum Revenue of $50,000 per day can be achieved by setting
    the rental price to $100 per day.
=#

# Visualize Conclusion (for nonlinear)

# select Frontend and Backend
