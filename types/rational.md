

```julia
y = Rational(0.5)       # 1//2
fieldnames(typeof(y))   # (:num, :den)
y.num                   # 1
```