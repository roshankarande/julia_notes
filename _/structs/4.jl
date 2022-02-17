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

    function BankAccount(owner::String, C::T) where {T <: Currency}
        return new{C}(owner, Currency[C(0)])
    end
end

b = BankAccount("Paul", Euro)
push!(b.transaction, Dollar(2))
