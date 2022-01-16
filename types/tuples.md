```julia
t = (1, 2.0, "3")
a,b,c = (1,2,3)

t1 = (a,b,c) # unnamed tuple
t2 = (a = 1, b = 2, c = 3) # named tuple 
t3 = (;a,b,c) # named tuple where the names are same as the var names.. and values are var values
t3[1] == t3.a
```