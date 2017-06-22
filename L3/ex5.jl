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

f(x) = (3 * x) - (e ^ x)

println("f(x) = 3x - e^x\n\n")

(root, value, it_num, errno) = 	mbisekcji(f, 0.0, 1.0, 10 ^ (-4.0), 10 ^ (-4.0))
println("Bisection\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)


(root, value, it_num, errno) = 	mbisekcji(f, 1.0, 2.0, 10 ^ (-4.0), 10 ^ (-4.0))
println("Bisection\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)
