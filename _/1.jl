using InteractiveUtils

function supertypes_tree(T::Type)
    T == Any && return
    supertypes_tree(supertype(T))
    print("$T -> ")
end

abstract type Student end

struct Master <: Student
    salary
end

struct Doctoral <: Student
    salary
    exam_mid ::Bool
    exam_english ::Bool
end

function salary_yearly(s::Student)
    return 12*salary_monthly(s) 
end

function salary_monthly(s::Master)
    return s.salary
end

function salary_monthly(s::Doctoral)
    return s.salary + s.exam_mid*2000 + s.exam_english*1000
end

s1 = Master(5000)
s2 = Doctoral(30000, 1, 0)