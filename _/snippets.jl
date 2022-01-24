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

