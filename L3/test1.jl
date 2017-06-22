#=
	Author: Michal Kukowski
	email: michalkukowski10@gmail.com
=#

include("my_module.jl")
using my_module

local root :: Float64
local value :: Float64
local it_num :: Int
local errno :: Int

f(x) = x + 41
df(x) = 1

println("f(x) = x + 41, x0 = -41\n\n")

(root, value, it_num, errno) = mbisekcji(f, -50.0, 50.0, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0))
println("Bisection\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)

(root, value, it_num, errno) = mstycznych(f, df, -50.0 ,0.5 * 10 ^ (-5.0), 0.5 * 10 ^(-5.0), 30)
println("\nNewton-Raphson\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)

(root, value, it_num, errno) = msiecznych(f, -50.0, -30.0, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0), 30)
println("\nSecant Method\n")
println("Root\t=\t", root)
println("Value\t=\t", value)
println("Steps\t=\t", it_num)
println("Errno\t=\t", errno)
