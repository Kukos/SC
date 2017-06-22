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


f(x) = e ^ (1 - x) - 1
g(x) = x * (e ^ (-x))

df(x) = -e ^ (1 - x)
dg(x) = (-e ^ (-x)) * (x - 1)

println("f(x) = e ^ (1 - x) - 1\n\n")

(root, value, it_num, errno) = mbisekcji(f, 0.3, 1.3, 10 ^ (-5.0), 10 ^ (-5.0))
println("Bisection\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)


(root, value, it_num, errno) = mstycznych(f, df, 2.0, 10 ^ (-5.0), 10 ^ (-5.0), 30)
println("\nNewton-Raphson\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)

(root, value, it_num, errno) = msiecznych(f, -5.0, 2.0, 10 ^ (-5.0), 10 ^ (-5.0), 30)
println("\nSecant Method\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)


println("\n\ng(x) = x * (e^-x)\n\n")

(root, value, it_num, errno) = mbisekcji(g, -0.4, 0.1, 10 ^ (-5.0), 10 ^ (-5.0))
println("Bisection\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)


(root, value, it_num, errno) = mstycznych(g, dg, 0.7, 10 ^ (-5.0), 10 ^ (-5.0), 30)
println("\nNewton-Raphson\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)


(root, value, it_num, errno) = msiecznych(g, -1.0, 0.3, 10 ^ (-5.0), 10 ^ (-5.0), 30)
println("\nSecant Method\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)
