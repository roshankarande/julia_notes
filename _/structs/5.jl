
# function add(x::T, y::T) where{T<:Real}
#     return x + y
# end

function add(x::U, y::V) where{U<:Real, V<:Real}
    vals =  promote(x, y)
    return sum(vals)
end



