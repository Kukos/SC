#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#

#=
    F(x) = sin(x) + cos(3x)

    PARAMS
    @IN x - float number

    RETURN
    %F(x)
=#
function f(x :: Float64) :: Float64
    return sin(x) + cos(Float64(3.0) * x)
end

#=
    F(x) = sin(x) + cos(3x) ==> F'(x) = cos(x) - 3sin(3x)

    PARAMS
    @IN x - float number

    RETURN
    %F'(x)
=#
function deriv_f(x :: Float64) :: Float64
    return cos(x) - Float64(3.0) * sin(Float64(3.0) * x)
end

#=
    Calculate derivative of F(x) defined in ex7 using definision

    PARAMS
    @IN x - argument of function
    @IN h - delta of function

    RETURN
    %F'(x)
=#
function deriv_def_f(x ::Float64, h :: Float64) :: Float64
    return (f(x + h) - f(x)) / h
end


# MAIN

local x :: Float64
local h :: Float64
local n :: Int

local r1 :: Float64
local r2 :: Float64

x = Float64(1.0)
n = 54
for i = 0 : n
    h = Float64(2.0)^(-i)
    r1 = deriv_def_f(x,h)
    r2 = deriv_f(x)

    println("H = 2^(-", i, ")")
    println("Using DEF F'(", x, ") = ", r1)
    println("Using formula F'(", x, ") = ", r2)
    println("Measured error = ", abs(r1 - r2))
    println()
end

for i = 0 : n
    h = Float64(2.0)^(-i) + Float64(1.0)
    r1 = deriv_def_f(x,h)
    r2 = deriv_f(x)

    println("H = 2^(-", i, ") + 1")
    println("Using DEF F'(", x, ") = ", r1)
    println("Using formula F'(", x, ") = ", r2)
    println("Measured error = ", abs(r1 - r2))
    println()

end
