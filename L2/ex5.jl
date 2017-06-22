#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#


#=
    Function calculate p[n] from expr:
    x[n + 1] = x[n]^2 + c

    PARAMS:
    @IN x - x[0]
    @IN c - c constanst
    @IN n - nth x to calculate

    RETURN:
    %x[n]
=#
function expression{T}(x :: T, c :: T, n :: Int) :: T
    local old_value :: T
    local new_value :: T

    old_value = x
    for i = 1: n
        new_value = old_value^T(2.0) + c
        old_value = new_value
    end

    return old_value
end

# MAIN

local n :: Int
n = 40

println("X[0] = 1 C = -2")
println("X[",n,"] = ", expression(Float64(1.0),Float64(-2.0),n))
println("\nX[0] = 2 C = -2")
println("X[",n,"] = ", expression(Float64(2.0),Float64(-2.0),n))
println("\nX[0] = 1.99999999999999 C = -2")
println("X[",n,"] = ", expression(Float64(1.99999999999999),Float64(-2.0),n))
println("\nX[0] = 1 C = -1")
println("X[",n,"] = ", expression(Float64(1.0),Float64(-1.0),n))
println("\nX[0] = -1 C = -1")
println("X[",n,"] = ", expression(Float64(-1.0),Float64(-1.0),n))
println("\nX[0] = 0.75 C = -1")
println("X[",n,"] = ", expression(Float64(0.75),Float64(-1.0),n))
println("\nX[0] = 0.25 C = -1")
println("X[",n,"] = ", expression(Float64(0.25),Float64(-1.0),n))
