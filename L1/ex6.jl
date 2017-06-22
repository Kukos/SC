#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#


#=
    Function defined in ex6
    PARAMS
    @IN x - Float64 number

    RETURN:
    %F(X)
=#
function f(x :: Float64) :: Float64
    return sqrt(x^2 + Float64(1.0)) - Float64(1.0)
end


#=
    Function defined in ex6
    PARAMS
    @IN x - Float64 number

    RETURN:
    %G(X)
=#
function g(x :: Float64) :: Float64
    return x^2 / (sqrt(x^2 + Float64(1.0)) + Float64(1.0))
end


# MAIN

local x :: Float64
local n :: Int8

n = 10
x = Float64(1.0) / Float64(8.0)

for i = 1 : n
    println("F(8^(-", i, ")) = ", f(x))
    println("G(8^(-", i, ")) = ", g(x))
    x /= Float64(8.0)
    println()
end
