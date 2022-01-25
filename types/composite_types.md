```julia
struct Rectangle
    bottomleft::Vector{Float64}
    width
    height
end

r = Rectangle([1,2], 3, 4)  # Rectangle([1.0, 2.0], 3, 4)

isa(r, Rectangle) # true
methods(Rectangle) # [1] Rectangle(bottomleft::Vector{Float64}, width, height) [2] Rectangle(bottomleft, width, height)

r.width 

area(r::Rectangle) = r.width * r.height
fieldnames(Rectangle)
fieldnames(typeof(r))

# However, immutability is not recursive. If an immutable object contains a mutable object, such as an array, elements of this mutable object can be modified. Even though Rectangle is an immutable type, its bottomleft field is a mutable array and can be changed.

r.bottomleft[1] = 5
r.bottomleft  # [5, 2]

```

## Mutable Structs

```julia
# To allow changing their fields, we need to define composite types as mutable by adding the mutable keyword.

mutable struct MutableRectangle
    bottomleft::Vector{Float64}
    width
    height
end

# The area function defined earlier will only work for Rectangle but not for MutableRectangle types. To define it for both types, we need type unions. The Union keyword creates a supertype of its inputs.

const GenericRectangle = Union{Rectangle, MutableRectangle} # Union{MutableRectangle, Rectangle}
Rectangle <: GenericRectangle # true
MutableRectangle <: GenericRectangle # true

# We now create the perimeter(r::GenericRectangle) function. Since we specify that its input is an GenericRectangle, it will work for both mutable MutableRectangle and immutable Rectangle type
perimeter(r::GenericRectangle) = 2*(r.width + r.height)

```

## Abstract Types

```julia

abstract type AbstractPoint{T} end

# T is a subtype of Real
struct Point{T <: Real} <: AbstractPoint{T}
    x::T
    y::T
end

# Instantiating
 Point(1, 2)
 Point{Int64}(1,2)
 Point(1.0, 2) # this will give an error as Parameter type is ambiguous

# NOTE!!
coordinates(p::Point{Real}) = (p.x, p.y)
coordinates(Point(1,2)) # error
coordinates(Point(1.0, 2.0)) # error
# Concrete Point types with different T values are never subtypes of each other. Even though Float64 is a subtype of Real, Point{Float64} is not a subtype of Point{Real}. It has to do with efficieny gains - memory representation of T.

# Correct way to define this is 
coordinates(p::Point{<:Real}) = (p.x, p.y)

# It is also possible to define a function for all subtypes of some abstract type.
Base.show(io::IO, p::AbstractPoint) = print(io, "$(coordinates(p))------!!")

# Let us define a new struct
struct Point3D{T <: Real} <: AbstractPoint{T}
    x::T
    y::T
    z::T
end

coordinates(p::Point3D) = (p.x, p.y, p.z)
# Since the show function was defined for the abstract type AbstractPoint and uses the coordinates function, the custom print is applied to Point3D without the need for further changes.

Point(x::Real, y::Real) = Point(promote(x, y)...)
Point(1, 2.0)  # (1.0, 2.0)
typeof(Point(1, 2.0))   # Point{Float64}

```


## Constructors
https://docs.julialang.org/en/v1/manual/constructors/

 
 ## Paramteric paradigm
https://docs.julialang.org/en/v1/manual/methods/#Parametric-Methods

 ```julia
same_type(x::T, y::T) where {T} = true
same_type(x,y) = false
mytypeof(x::T) where {T} = T
myappend(v::Vector{T}, x::T) where {T} = [v..., x]
mytypeof(x::T) where {T} = T
same_type_numeric(x::T, y::T) where {T<:Number} = true
bar(a,b,x::Vararg{Any,2}) = (a,b,x) #  The notation Vararg{T,N} is used to indicate such a constraint x has to be a tuple of length 2

# It is possible to constrain varargs methods by a parameter
function getindex(A::AbstractArray{T,N}, indices::Vararg{Number,N}) where {T,N} 
# would be called only when the number of indices matches the dimensionality of the array.

 ```

 ```julia
 abstract type Currency end

struct Euro <: Currency
    value::Float64
end

struct Dollar <: Currency
    value::Float64
end

struct BankAccount{C<:Currency}
    owner::String
    transaction::Vector{Currency}

    function BankAccount(owner::String, C::Type{<:Currency})
        return new{C}(owner, Currency[C(0)])
        # It is crucial to use Currency in Currency[C(0)]. Without it, we would create an array of type C only
    end
end

# NOTE!!  function BankAccount(owner::String, C::T) where {T <: Currency}
# this is different as it would ask you to pass an instance of T and not  type

 ```