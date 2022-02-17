
## broadcast
```julia
@. # automatically adds a dot before each operator and each function

B = rand(4,4)
t = @. exp((B + 1) ^ 2) / 2 == exp.((B .+ 1) .^ 2) ./ 2
all(t) # true
```
 
 ## view and views
```julia
@view and @views # while slicing. avoids creating a new object.

A = [1 2 3; 4 5 6]
E = @view A[1:2] # E would point to the same portion as A[1:2]

@views # for multiple slices in a statement, block, function

```

## show
```julia
@show # The @show macro in this example prints the results of an expression. It can also be used to print multiple variables at once.

i = 1
while i <= 5
    @show i
    i += 1
end

a, b, c = 1, "hello", :world;

@show (a, b, c);
(a, b, c) = (1, "hello", :world)

```

## which

```julia
@which # returns the method that is called for given arguments.

@which max(1, 4.5) # max(x::Real, y::Real) 
```

## code_

```julia
@code_native
@code_llvm
@code_typed
```

## assert

```julia
suit = 34
@assert(1 ≤ suit ≤ 4, "suit is not between 1 and 4")
```

## test
```julia
@test Card(1, 3) < Card(1, 4)
```

## progress

```julia
using ProgressLogging

@progress "loop" for i in 1:100
    sleep(0.01)
end
# in vscode you can see the notifications in the bottom to see what is going on

```

## @edit

```julia
@edit @time print() # let's you open the definition file for @time

@edit print()
```
