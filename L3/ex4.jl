#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#

include("my_module.jl")
using my_module

# MAIN

local root :: Float64
local value :: Float64
local it_num :: Int
local errno :: Int


f(x)= sin(x) - (0.5 * x) ^ (2.0)
df(x) = cos(x) - 0.5 * x


println("f(x) = sin(x) - 0.5x^2\n\n")

(root, value, it_num, errno) = mbisekcji(f, 1.5, 2.0, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0))
println("Bisection\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)


(root, value, it_num, errno) = mstycznych(f, df, 1.5 ,0.5 * 10 ^ (-5.0), 0.5 * 10 ^(-5.0), 30)
println("\nNewton-Raphson\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)

(root, value, it_num, errno) = msiecznych(f, 1.0, 2.0, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0), 30)
println("\nSecant Method\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)
