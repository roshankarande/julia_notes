## Type Stable Code in Julia


References 

-----------------
* https://docs.julialang.org/en/v1/manual/faq/#man-type-stability
* [Intro video](https://www.youtube.com/watch?v=rfVNK7ibRFc )
* https://arxiv.org/pdf/2109.01950.pdf
* https://github.com/prl-julia/julia-type-stability

---------------

Functions that are type stable can be optimized in a much more... hence it is important to create type stable code.

Type Stable function means that the type of the output is predictable from the types of the inputs. In particular, it means that the type of the output cannot vary depending on the values of the inputs.

```julia
# type unstable as it would return value with be of Union{typeof(n), 0}
function get_n_or_zero(n)
    return n > 0 ? n : 0
end

@code_warntype get_n_or_zero(0.2) # Body::Union{Float64, Int64}
@code_warntype get_n_or_zero(2)   # Body::Int64

# type stable
function get_n_or_zero(n)
    return n > 0 ? n : zero(n)
end
```

