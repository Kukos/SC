#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#

include("hilb.jl")
include("matcond.jl")

# MAIN
local T :: Type # Float64 / Float32 / Float16

local b :: Vector{T}

local c :: Vector{T} # matrix condition
local n :: Vector{Int} # matrix size

# results
local x1 :: Vector{T}
local x2 :: Vector{T}

local hilbert_n :: Int

# errors
local error1 :: T
local error2 :: T

T = Float64
hilbert_n = 20

# values from ex2
c = [T(1), T(10), T(10^3), T(10^7), T(10^12), T(10^16)]
n = [5, 10, 20]

# hilbert matrix
println("Hilbert Matrix\n")
for i = 1: hilbert_n
    x = Array(T, 1, i);
    x[1:end] = 1.0;
    x = x'
    matrix_hilbert = hilb(i)
    b = matrix_hilbert * x

    x1 = matrix_hilbert \ b
    x2 = inv(matrix_hilbert) * b

    error1 = norm(x1 - x) / norm(x);
    error2 = norm(x2 - x) / norm(x);

    println("Size: ", i, " x ", i, "\tCOND: ", cond(matrix_hilbert))
    println("Error1: ", error1)
    println("Error2: ", error2)
    println()

end

# random matrix
println("\n\nRandom Matrix\n")
for i = 1: length(n)
    for j = 1: length(c)
        x = Array(T, 1, n[i]);
        x[1:end] = 1.0;
        x = x'
        matrix_random = matcond(n[i],c[j])
        b = matrix_random * x

        x1 = matrix_random \ b
        x2 = inv(matrix_random) * b

        error1 = norm(x1 - x) / norm(x);
        error2 = norm(x2 - x) / norm(x);

        println("Size: ", n[i], " x ", n[i], "\tCOND: ", cond(matrix_random))
        println("Error1: ", error1)
        println("Error2: ", error2)
        println()
    end
end
