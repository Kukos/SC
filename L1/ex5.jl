#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#


#=
    PARAMS
    @IN x - vector of real numbers
    @IN y - vector of real numbers

    RETURN:
    % Scalar mult X and Y
=#
function scalar1{T <: Real}(x :: Vector{T}, y :: Vector{T}) :: T

    local sum :: T # SUM[X[i] * Y[i], {i,1,n}]

    sum = T(0.0)
    for i = 1: length(x)
        sum += x[i] * y[i]
    end

    return sum
end

#=
    PARAMS
    @IN x - vector of real numbers
    @IN y - vector of real numbers

    RETURN:
    % Scalar mult X and Y
=#
function scalar2{T <: Real}(x :: Vector{T}, y :: Vector{T}) :: T

    local sum :: T # SUM[X[i] * Y[i], {i,1,n}]

    sum = T(0.0)
    for i = length(x): -1: 1
        sum += x[i] * y[i]
    end

    return sum
end

#=

    PARAMS
    @IN x - vector of real numbers
    @IN y - vector of real numbers

    RETURN:
    % Scalar mult X and Y
=#
function scalar3{T <: Real}(x :: Vector{T}, y :: Vector{T}) :: T

    local mult :: Vector{T} # new temp vector
    local sum1 :: T # SUM[X[i] * Y[i], {i,1,n}] only >= 0
    local sum2 :: T # SUM[X[i] * Y[i], {i,1,n}] only < 0
    local i :: Int8 # iterator

    sum1 = T(0.0)
    sum2 = T(0.0)

    # mult of 2 vectors x and y
    mult = x .* y

    # sort in place with reverse order
    sort!(mult, rev = true, alg = InsertionSort)

    # add >= 0
    i = 1
    while i <= length(mult) && mult[i] >= 0
        sum1 += mult[i]
        i += 1
    end

    # add < 0
    for j = length(mult): -1: i
        sum2 += mult[j]
    end

    return sum1 + sum2
end

function scalar4{T <: Real}(x :: Vector{T}, y :: Vector{T}) :: T

    local mult :: Vector{T} # new temp vector
    local sum1 :: T # SUM[X[i] * Y[i], {i,1,n}] only < 0
    local sum2 :: T # SUM[X[i] * Y[i], {i,1,n}] only >= 0
    local i :: Int8 # iterator

    sum1 = T(0.0)
    sum2 = T(0.0)

    # scalar mult of 2 vectors x and y
    mult = x .* y

    # sort in place
    sort!(mult, alg = InsertionSort)

    # find index where mult[i] >= 0
    i = 1
    while i <= length(mult) && mult[i] < 0
        i += 1
    end

    # add < 0
    for j = i - 1: -1: 1
        sum1 += mult[j]
    end

    # add > 0
    for j = i: length(mult)
        sum2 += mult[j]
    end

    return sum1 + sum2
end

#MAIN

local xF32 :: Vector{Float32} # x from ex5
local yF32 :: Vector{Float32} # y from ex5

local xF64 :: Vector{Float64} # x from ex5
local yF64 :: Vector{Float64} # y from ex5

xF32 = [    Float32(2.718281828),
            Float32(-3.141592654),
            Float32(1.414213562),
            Float32(0.5772156649),
            Float32(0.3010299957) ]

yF32 = [    Float32(1486.2497),
            Float32(878366.9879),
            Float32(-22.37492),
            Float32(4773714.647),
            Float32(0.000185049) ]

xF64 = [    Float64(2.718281828),
            Float64(-3.141592654),
            Float64(1.414213562),
            Float64(0.5772156649),
            Float64(0.3010299957) ]

yF64 = [    Float64(1486.2497),
            Float64(878366.9879),
            Float64(-22.37492),
            Float64(4773714.647),
            Float64(0.000185049) ]

println("Float32")
println("S1 = " ,scalar1(xF32,yF32))
println("S2 = ", scalar2(xF32,yF32))
println("S3 = ", scalar3(xF32,yF32))
println("S4 = ", scalar4(xF32,yF32))
println("\nFloat64")
println("S1 = " ,scalar1(xF64,yF64))
println("S2 = ", scalar2(xF64,yF64))
println("S3 = ", scalar3(xF64,yF64))
println("S4 = ", scalar4(xF64,yF64))
