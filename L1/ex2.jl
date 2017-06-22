#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#

#=
    Function Calculate Machine epsilon by Kahan expression
    and print on stdout defined epsilon in julia
    and calculated epsilon

    PARAMS
    @IN T - type only Float[16 / 32 / 64]

    RETURN:
    This is a "void" function
=#
function kahan(T :: Type)

    local epsilon :: T # machine epsilon

    #Kahan expression
    epsilon = T(3.0) * ( T(4.0) / T(3.0) - T(1.0) ) - T(1.0)

    println("TYPE: ", T)
    println("KAHAN EPS: ", epsilon)
    println("EPS: ", eps(T))
    println()
end


#MAIN
kahan(Float16)
kahan(Float32)
kahan(Float64)
