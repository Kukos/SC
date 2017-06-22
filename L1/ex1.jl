#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#

global const C_FLT_EPSILON = "1.1920928955078125e-7"
global const C_DBL_EPSILON = "2.220446049250313080847263336181640625e-16"

global const C_FLT_MAX = "3.4028234663852885981170418348451692544e+38"
global const C_DBL_MAX = "1.79769313486231570814527423731704356798070e+308"

#=
    Function Calculate Machine epsilon
    and print on stdout defined epislon in julia
    and calculated epsilon

    PARAMS
    @IN T - type only Float[16 / 32 / 64]

    RETURN:
    This is a "void" function
=#
function my_eps(T :: Type)
    local epsilon :: T # machine epsilon
    local old_epsilon :: T # to save prev value

    epsilon = T(1.0)
    while epsilon + T(1.0) > T(1.0)
        old_epsilon = epsilon
        epsilon /= T(2.0)
    end

    println("TYPE:  ", T)
    println("EPS: ", eps(T))
    println("MY EPS: ", old_epsilon)
    println("C_FLT_EPS: ", C_FLT_EPSILON)
    println("C_DBL_EPS: ", C_DBL_EPSILON)
    println()
end

#=
    Function Calculate ETA
    and print on stdout defined ETA in julia
    and calculated ETA

    PARAMS
    @IN T - type only Float[16 / 32 / 64]

    RETURN:
    This is a "void" function
=#
function my_eta(T :: Type)
    local eta :: T # calculated eta
    local old_eta :: T # to save prev value

    eta = T(1.0)
    while eta > T(0.0)
        old_eta = eta
        eta /= T(2.0)
    end

    println("TYPE:  ", T)
    println("ETA: ", nextfloat(T(0.0)))
    println("MY ETA: ", old_eta)
    println()
end

#=
    Function Calculate MAX Representaive value
    and print on stdout defined max value in julia
    and calculated max value

    PARAMS
    @IN T - type only Float[16 / 32 / 64]

    RETURN:
    This is a "void" function
=#
function my_max(T :: Type)
    local max :: T # max value
    local old_max :: T # to save prev value

    # After loop: max = inf, old_max = max / 2
    max = T(1.0)
    while ! isinf(max)
        old_max = max
        max *= T(2.0)
    end

    #=  Now if add old to max, then max will be inf,
        So div by 2 and  Fill other mantysa bits
        by adding old to max, while max is less than inf
    =#
    max = old_max
    old_max /= T(2.0)

    while ! isinf(max + old_max)
        max += old_max
        old_max /= T(2.0)
    end

    println("TYPE:  ", T)
    println("MAX: ", realmax(T))
    println("MY MAX: ", max)
    println("C MAX FLT: ", C_FLT_MAX)
    println("C MAX DBL: ", C_DBL_MAX)
    println()
end

#MAIN

my_eps(Float16)
my_eps(Float32)
my_eps(Float64)

my_eta(Float16)
my_eta(Float32)
my_eta(Float64)

my_max(Float16)
my_max(Float32)
my_max(Float64)
