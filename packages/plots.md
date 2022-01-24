# Plots.jl

Provides a unified interface tand toolset for creating plots. The plots themselves are drawn by different backends like GR (default backend very fast), PyPlot, PGFPlotsX or Plotly.

## Backend
```julia
# To use different backends
# add PlotlyJS
using Plots
plotlyjs()
Plots.PlotlyJSBackend()

# add PyPlot
using Plots
pyplot()
Plots.PyPlotBackend()
```
* https://docs.juliaplots.org/latest/backends/
* https://plotly.com/julia/


## Examples

```julia
using Plots
plot(range(0,2π;length=100), x -> sin(x);legend=false)
```

```julia
using Plots
x = range(0, 2π; length = 100)
y = sin.(x)
plot(x, y)
y = hcat(sin.(x), cos.(x)) # each column is treated as a separate plot series. So this will create 2 curves in one plot
plot(x,y)
plot!(x, sin.(x .+ π/4)) # to add stuff/modify the existly plot use plot!

# It is possible to name a figure and later use it for plotting
plt = plot(x, hcat(sin.(x), cos.(x)))   # same as plot(x, [sin, cos])
plot!(plt, x, sin.(x .+ π/4))

```

```julia
using Plots
f(x; k=1) = x^k
x = 0:0.1:10
plot(x, f.(x); label = "k=1", linewidth = 2, xlabel = "x", ylabel = "f(x)")
plot!(x, f.(x; k = 2); label = "k=2", linewidth = 2)
xlims!(0,11) ; ylims!(0,100)
```

```julia
# It is possible to directly pass in functions or multiple functions as below
t = range(0, 2π; length = 100)
plot(t, [sin, cos]; label = ["sine" "cosine"])

plot(t, t -> sin(2t); linewidth = 2, label = "")
```

```julia
# Instead of a vector of values, we can also use a similar syntax as for ranges with the starting point, stopping point, and optionally length.

t = range(0,2π,length = 500)
plot(sin, cos, t)
plot(sin, cos, 0,2π,500)  # equivalent to above one

plot(t, [sin cos]) # this is different as here x is t and y1 is sin(t) and y2 is cos(t)

```

```julia
fig = plot() # creates an empty plot
for i in 1:4
    plot!(fig, 0:0.01:1, x -> sin(i*x) )
end
fig  # display(fig)

```


The package follows a simple rule: Positional arguments are data (which should be plotted), while keyword arguments are attributes (which modify the style). 

There is a large number of attributes. The Plots package provides the plotattr function to print all attributes for series, plots, subplots, or axes.

```julia
plotattr(k)  # k can be :Plot, :Subplot, :Axis, :Series

#Once you acquire the list of attributes, you can either use the aliases of a specific attribute or investigate a specific attribute to print that attribute's aliases and its description.

plotattr("size")

# BEWARE!! that not all attributes are supported. Attributes that can be specified for different axes, such as xguide and yguide, are often not supported.
# Descriptions for these attributes can be found using the attribute name without the axis specification, i.e., guide instead of xguide.

plotattr("guide") # and not plotattr("xguide")
plotattr("lims") # and not plotattr("xlims") or plotattr("ylims")

```

This list of attributes includes:

* label: the label for a series, which appears in a legend.
* xguide, yguide: axis guide (label).
* legend: legend position.
* title: plot title.
* xticks, yticks: position and labels for ticks.
* color: series color.
* linestyle: style of the line.
* linewidth: width of the line.

```julia

using Plots
x = range(0, 2π; length = 100)
y = hcat(sin.(x), cos.(x))
plot(x, y;
    label = ["sine" "cosine"],
    xguide = "x",
    yguide = "y",
    legend = :bottomleft,
    title = "Trigonometric functions",
    xticks = (0:0.5π:2π, ["0", "0.5π", "π", "1.5π", "2π"]),
    color = [:red :blue],
    linestyle = [:dash :dot],
    linewidth = [2 4],
)
```

```julia
n = 200
x = range(0, 2π; length = n)
linewidth = range(1, 50; length = n) # here we are using line width as a range
color = palette(:viridis, n)
xlims = (0, 7)
ylims = (-1.2, 1.2)
label = ""
plot(x, sin.(x); linewidth, color, label, xlims, ylims)
```



```julia
# x and y values are dependent of parameter (t)
fx(t; a = 4.23, b = 2.35) = (a + b)*cos(t) - b*cos((a/b + 1)*t)
fy(t; a = 4.23, b = 2.35) = (a + b)*sin(t) - b*sin((a/b + 1)*t)

plot(fx, fy, -15, 20, 500;
    linewidth = 2,
    legend = false,
    axis = nothing,
    border = :none,
)
```

## Different plots
One way to change the plot series is the seriestype attribute. The following example plots the sine function by the scatter series type

```julia
x = range(0, 2π; length = 100)
y = sin.(x)
plot(x, y; seriestype = :scatter) # alias -> t = :scatter
scatter(x, y) # another way

kwargs = (
    color = :viridis,
    legend = false,
    cbar = false,
    axis = nothing,
    border = :none,
)
contourf(x, y, f; kwargs...)
heatmap(x, y, f; kwargs...)
surface(x, y, f; camera = (25, 65), kwargs...)
```

## Subplots

```julia
x = range(0, 2π; length = 100)
plot(x, [sin, cos, tan, sinc];
    layout = 4,
    linewidth = 2,
    legend = false,
    title = ["1" "2" "3" "4"],
)

# The layout keyword tells Plots package to draw each curve in a separate subplot. Attributes with multiple values (row vectors) apply each value to one subplot. The Plots package also provides the grid function used to create a subplot grid manually. 

plot(x, [sin, cos, tan, sinc];
    layout = grid(4, 1), # will create 4x1 subplots instead of 2x2 earlier
    linewidth = 2,
    legend = false,
)

# We can create more advanced layouts with the @layout macro. We create a non-symmetric layout with one subplot in the first row and two subplots in the second row. width of the first subplot in the second row is 0.3 of the whole plot width.
l = @layout [a ; b{0.3w} c]
plot(x, [sin, cos, tan]; layout = l, linewidth = 2, legend = false)

# All examples above can also be created incrementally. To recreate the last graph, we first create three plots.
linewidth = range(1, 20; length = 100)
p1 = plot(x, sin; line_z = 1:100, color = :viridis, linewidth)
p2 = plot(x, cos; line_z = 1:100, color = :Blues_9, linewidth)
p3 = plot(x, tan; line_z = 1:100, color = :hsv, linewidth)

l = @layout [a ; b{0.3w} c]
plot(p1, p2, p3; layout = l)

```

## Animations
