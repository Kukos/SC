#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#


#=
    Function find the fault in calculation in expr: x * (1 / x)

    PARAMS
    NO PARAMS

    RETURN:
    MIN number in range [1;2] such that x * (1 / x) != 1
=#
function find_cal_fault() :: Float64

    local x :: Float64

    x = Float64(1.0)

    while x < Float64(2.0) && (x * (Float64(1.0) / x) == Float64(1.0) )
        x = nextfloat(x)
    end

    return x
end

# MAIN
println("MIN x in range [1;2] such that x * (1 / x) != 1 is ", find_cal_fault())
