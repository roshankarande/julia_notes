## Caveats

**A constructor is calling a type as a function**. Two constructors are automatically generated when a type is created. One accepts any arguments and converts them to the field types, and the other accepts arguments that match the field types exactly. If all fields are Any, only one constructor is generated. Julia creates these two constructors to make it easier to add new definitions without replacing the default constructor. We can list all constructors by the methods function.

## ----

```julia
# It is generally not good to use containers with abstract element type as we did for storing transactions. We used it in the example above because we do not want to convert all transactions to a common currency. When we create an array from different types, the promotion system converts these types to their smallest supertype for efficient memory storage.

[Int32(123), 1, 1.5, 1.234] # 4-element Vector{Float64}: [123.0, 1.0, 1.5, 1.234]

# The smallest supertype is Float64, and the result is Array{Float64, 1}. When we do not want to convert the variables, we must manually specify the resulting array supertype.

Real[Int32(123), 1, 1.5, 1.234f0] # 4-element Vector{Real}: [123.0, 1.0, 1.5, 1.234]

In this case, the types of all elements are preserved.

```