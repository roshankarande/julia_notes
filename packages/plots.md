# Plots.jl

Provides a unified interface tand toolset for creating plots. The plots themselves are drawn by different backends like GR (default backend very fast), PyPlot, PGFPlotsX or Plotly.

https://docs.juliaplots.org/latest/backends/




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
plt = plot(x, hcat(sin.(x), cos.(x)))
plot!(plt, x, sin.(x .+ π/4))

```

```julia

f(x; k=1) = x^k

using Plots
x = 0:0.1:10

plot(x, f.(x); label = "k=1", linewidth = 2, xlabel = "x", ylabel = "f(x)")
plot!(x, f.(x; k = 2); label = "k=2", linewidth = 2)
plot!(x, f.(x; k = 3); label = "k=3", linewidth = 2)
xlims!(0,11)
ylims!(0,1100)

```

```julia

# It is possible to directly pass in functions or multiple functions as below
t = range(0, 2π; length = 100)
plot(t, [sin, cos]; label = ["sine" "cosine"])

plot(t, t -> sin(2t); linewidth = 2, label = "")
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