using InteractiveUtils

"Prints the abstract tree for a given type"
function supertypes_tree(T::Type)
    T == Any && return
    supertypes_tree(supertype(T))
    print("$T -> ")
end

function subtypes_tree(T::Type, level::Int = 0)
    T == Type[] && return

    print(repeat(" ", level), "$T\n")

    for s = subtypes(T)
        subtypes_tree(s,level + 4)
    end
end

## Functors

struct Polynomial{R}
    coeffs::Vector{R}
end

function (p::Polynomial)(x)
    v = p.coeffs[end]
    for i = (length(p.coeffs)-1):-1:1
        v = v*x + p.coeffs[i]
    end
    return v
end

(p::Polynomial)() = p(5) # specifies what to do when no value of x is pecified

p = Polynomial([1,10,100 ]) # Polynomial{Int64}([1, 10, 100])
julia> p(3) # 931
p()  # 2551
