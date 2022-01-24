using Plots

f(x,y) = (x^2 * y^2) / (x^4 + y^4)
x = y = range(-5,5; length = 200)

kwargs = (
    color = :viridis,
    legend = false,
    cbar = false,
    axis = nothing,
    border = :none,
)

scatter(x,y)
contourf(x, y, f; kwargs...)
heatmap(x, y, f; kwargs...)
surface(x, y, f; camera = (25, 65), kwargs...)
