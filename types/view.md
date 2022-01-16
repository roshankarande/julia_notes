
### Views
As in other programming languages, arrays are pointers to memory location. Thus we need to pay attention to how we handle them. If we create an array A and assign it to a variable B, the original array elements can be modified by changing B.

```julia

A = [1 2 3; 4 5 6]
B = A
B[2] = 42

#  We can check that both arrays are equal even though we modified only array B. The reason is that Julia, by default, does not create a copy of an array when assigning to a variable. This behavior is  advantageous because it saves memory. However, it also may have undesirable effects. If we want to make a copy of an array, we have to use the copy function.

A == B # true 

C = copy(A)
C[4] = 10
A == C # false

# However, Different behaviour occurs when accessing elements. Every time we access multiple array elements at once, a new array is created. In this case, we modified array D, while array A remains unchanged.
D = A[1:2, 1:2]
D[1] = 15
D == A[1:2, 1:2] # false

# Even if we want to select a subarray, it may be useful to create only a link to the original array and not create a new array. This can be achieved by the view function or the @view macro.
E = view(A, 1:2, 1:2)
E = @view A[1:2, 1:2] # convenient

# If we change only the array D, this change is propagated to A.
E[4] = 78
E == A[1:2, 1:2] # true

# The function view creates the special type SubArray. Since SubArray is a subtype of AbstractArray, we can apply any function defined for AbstractArrays to SubArray. In other words, (almost) all functions that work for arrays will also work for subarrays.

# This means that we can use arrays and subarrays interchangeably without the necessity of changing existing code. Of course, there are some limitations, but we will talk about them later.

# The @view macro can only be applied directly to a reference expression. We do not want to use views throughout the whole expression in many cases. In such a case, we can add the @view macro before each array-slicing operation. However, the resulting expression is long and difficult to read.

sum(exp.(sqrt.(abs.(@view(A[1, :]) .- @view(A[2, :]))))./2)

# To simplify this task, Julia provides the @views macro that converts every array-slicing operation in the given expression to return a view.

@views sum(exp.(sqrt.(abs.(A[1, :] .- A[2, :])))./2)
@views begin
# ...
end
@ views function f() 
# ...
end

```