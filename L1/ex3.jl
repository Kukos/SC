#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#

#=
    THEORY:
    Every double number in range [1;2] can be represented by X = 1.0 + k * delta
    Where k is in range [1;2^52 - 1] and delta = 2^-52

    This Function check THEORY

    PARAMS
    NO PARAMS

    RETURN:
    %true if theory is true
    %false if theory is false

    WARNING:
    This function takes 2^52 steps so be carefull about your CPU
=#
function checkF64() :: Bool
    local delta :: Float64 # delta from THEORY
    local x :: Float64 # calculated by theory formula
    local y :: Float64 # calculated by nextfloat
    local k :: Int64 # k from THEORY

    k = 1
    delta = Float64(2.0) ^ (-52)

    x = Float64(1.0) + k * delta
    y = x

    # check every numbers in range [1;2]
    while x < Float64(2.0)
        if x != y
            return false
        end
        k += 1
        x = Float64(1.0) + Float64(k) * delta
        y = nextfloat(y)
    end

    return true
end

#MAIN
local check ::Bool # result of checkF64 function
check = checkF64()

println("Every double number in range [1;2] can be represented by X = 1.0 + k * delta")
println("Where k is in range [1;2^52 - 1] and delta = 2^-52 ?")
if check
    println("YES")
else
    println("NO")
end
