# Plots.jl

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