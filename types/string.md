

```julia
str = "Hello, world."    # "Hello, world."
# Multiline strings are created using """ """
str[1:5]  #  "Hello" 
str[[1,2,5,6]]   #   "Heo,"

msg = "#Hello# from Julia";
replace(msg, "Hello" => "Hi!")  # "#Hi!# from Julia"   
reverse(msg)  
# Note: replace, reverse do not mutate the variable ( hence no ! )... do assignment to change the value of variable

split(msg) # by default splits by  white spaces
split(str, " a "), # " a " is a delimiter here

join(["Hello", "World!"])                 # "HelloWorld!"
join(["Hello", "World!"],"---")           # "Hello---World!"

contains("JuliaLang is pretty cool!", "Julia") # true
endswith("figure.png", "png")   # true

str = "JuliaLang is a pretty cool language!"

findall('a', str)  # returns indices where is a is present in str
findfirst('a', str)
findlast('a', str)

replace("Sherlock Holmes", "e" => uppercase)    # "ShErlock HolmEs" .. uppercase is a function
# can have lowercase, titlecase etc..


```

Note 'c' is a character c and "c" is string c and they are different... A string is made up of characters
```julia
z = "c"   # "c"
t = 'c'   # 'c': ASCII/Unicode U+0063 (category Ll: Letter, lowercase)
z == t    # false
z[1] == t #  true
```


```julia
raw"rwe" # raw string

 ```

 ### To replace at particular index

 ```julia
 as = collect("aaaa")
 as[2] = 'b'
 join(as)
 ```