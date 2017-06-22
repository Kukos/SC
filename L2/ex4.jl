#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#


#=
    Function calculate p[n] from expr:
    p[n + 1] = p[n] + r * p[n] * (1 - p[n])

    PARAMS:
    @IN p - p[0]
    @IN r - r constanst
    @IN n - nth p to calculate

    RETURN:
    %p[n]
=#
function expression{T}(p :: T, r :: T, n :: Int) :: T
    local old_value :: T
    local new_value :: T

    old_value = p
    for i = 1: n
        new_value = old_value + r * old_value * (T(1.0) - old_value)
        old_value = new_value
    end

    return old_value
end

# MAIN
local n1 :: Int # steps in normal mode
local n2 :: Int # steps in 1st part of mix mode
local n3 :: Int # steps in 2nd part of mix mode
local temp :: Float64

n1 = 40
n2 = 10
n3 = 30


println("Float32")
println("P[", n1, "]", " = ", expression(Float32(0.01),Float32(3.0),n1))

println("\nFloat64")
println("P[", n1, "]", " = ", expression(Float64(0.01),Float64(3.0),n1))

println("\nFloat32")
temp = expression(Float32(0.01),Float32(3.0),n2)
println("P[", n2, "]", " = ", temp)
println("floor(P[", n2, "]", " = ", temp, ", 3) = ",floor(temp,3))
println("P'[", n2 + n3, "]", " = ", expression(floor(temp,3),Float32(3.0),n3))
