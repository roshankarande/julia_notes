```julia
ex = :(x+y)

quote
    $(ex)
end

quote
    ex
end

@macroexpand @time sleep(1)

```

## @generated
```julia
# @generated is used to annotate a function which will be generated. In the body of the generated function, only
#   types of arguments can be read (not the values). The function returns a quoted expression evaluated when the
#   function is called. The @generated macro should not be used on functions mutating the global scope or
#   depending on mutable elements.


 @generated function bar(x)
    if x <: Integer
        return :(x ^ 2)
    else
        return :(x)
    end
end

bar(4)  #   16
bar("baz") #  "baz"
```