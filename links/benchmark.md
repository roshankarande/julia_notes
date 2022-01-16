https://juliaci.github.io/BenchmarkTools.jl/dev/manual/#Benchmark-Parameters


```julia
	function μₜ_Δ(v, samples=5, evals=2,seconds=30)
	    b = @benchmark	detect_triangle(undirected_graph(v)) samples=samples evals=evals seconds=seconds
	    return mean(b.times)
	end

# "evaluation": a single execution of a benchmark expression.... default 1
# "sample": a single time/memory measurement obtained by running multiple evaluations....default 10000
# "trial": an experiment in which multiple samples are gathered (or the result of such an experiment).


# seconds: The number of seconds budgeted for the benchmarking process. The trial will terminate if this time is exceeded (regardless of samples), but at least one sample will always be taken.... default 5
```