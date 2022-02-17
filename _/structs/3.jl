abstract type AbstractPoint{T} end

struct PointND{N, T<:Real} <: AbstractPoint{T}
    x::NTuple{N, T}

    function PointND(args::Real...) 
       vals = promote(args...)
       return new{length(vals),eltype(vals)}(x)
    end
end

coordinates(p::PointND) = p.x
dim(p::PointND{N}) where N = N
``
Base.@kwdef struct Gauss{T<:Real}
    μ::T = 0
    σ::T = 1

    function Gauss(μ::Real, σ::Real)
        σ^2 > 0 || error("the variance `σ^2` must be positive")
        pars = promote(μ, σ)
        return new{eltype(pars)}(pars...)
    end
end

(d::Gauss)(x::Real) = exp(-1/2 * ((x - d.μ)/d.σ)^2)/(d.σ * sqrt(2*π))
