## Modules

Modules in Julia are separate variable workspaces that provide three key features. They all help to prevent unexpected name clashes.

* They define top-level definitions (global variables) without worrying about name conflicts.
* They control the visibility of variables/functions/types outside of the module via exporting.
* They control the visibility of variables/functions/types from other modules via importing.

```julia
module Points

using LinearAlgebra

export Point, distance

struct Point{T <: Real}
    x::T
    y::T
end

coordinates(p::Point) = (p.x, p.y)
Base.show(io::IO, p::Point) = print(io, coordinates(p))
distance(p::Point, q::Point) = norm(coordinates(q) .- coordinates(p), 2)

end

```
The following example defines the module Points. We create it with the **module** keyword and load the LinearAlgebra package by the **using** keyword. Then we use the export keyword to **export** the Point type and the distance function. Finally, we write the actual content of the module.

Assume now that we want to load this module from a different file. Since each package core is a module, packages are loaded in the same way as modules. We need to specify using **Main.Points or using .Points** because we defined the package in the **Main scope**. If we loaded an external package Points, we would use **using Points**.

```julia
using .Points | # or Points if it is external package
p = Point(4,2) # After loading a package, we can directly access all the exported data.
distance(p, q)

Points.coordinates(p) # It is also possible to access all non-exported functions and types. To do so, we need to specify which module they are defined in.

# If you want to use direcly coordinates(p) 
using .Points: coordinates # comma separated if multiple
coordinates(p)
```

```julia
module MyModule

include("file1.jl")
include("file2.jl")

end
```