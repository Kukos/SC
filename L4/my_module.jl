#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#

export ilorazyRoznicowe
export warNewton
export rysujNnfx

using PyPlot

#=

    Calc Difference quotients

    PARAMS
    @IN x - vector of nodes
    @IN f - vector of values of function f

    RETURN:
    Vector fx - Difference quotients

=#
function ilorazyRoznicowe(x :: Vector{Float64}, f :: Vector{Float64})

    local fx :: Vector{Float64}
    local i :: Int
    local j :: Int
    local len :: Int

    len = length(f)

    #Init
    fx = Vector{Float64}(len)

    #Copy
    for i = 1: len
        fx[i] = f[i]
    end

    #Calc Difference quotients
    for i = 2: len
		for j = len: -1: i
			fx[j] = (fx[j] - fx[j - 1]) / (x[j] - x[j - i + 1])
		end
	end

    return fx
end


#=
    Calc poly value with Newton form using Horner algorithm

    PARAMS
    @IN x - vector with nodes
    @IN fx - vector with Difference quotients
    @IN t - poly point where we calc value

    RETURN:
    poly value
=#
function warNewton(x :: Vector{Float64}, fx :: Vector{Float64}, t :: Float64)

    local val :: Float64
    local i :: Int
    local len :: Int

    len = length(fx)

    val = fx[len]

	for i= len - 1: -1: 1
		val = fx[i] + (t - x[i]) * val
	end

    return val
end

#=
    Calc interpolation and draw plot poly anf function

    PARAMS
    @IN f - function
    @IN a - min range
    @IN b- max range
    @IN n - poly deg
=#

function rysujNnfx(f, a :: Float64, b :: Float64, n :: Int)

    local x :: Vector{Float64} # nodes
    local fx :: Vector{Float64} # Difference quotients
    local val :: Vector{Float64} # val of f(xi)

    # Real values
    local r_val :: Vector{Float64}
    local r_x :: Vector{Float64}

    #Value from Horner algorith
    local h_val :: Vector{Float64}

    local move :: Float64 # points movement
    local h :: Float64

    local i :: Int
    local max_loop :: Int
    local mult :: Int

    #INIT
    x = Vector{Float64}(n + 1)
    val = Vector{Float64}(n + 1)
    fx = Vector{Float64}(n + 1)

    mult = 5

    r_val = Vector{Float64}( mult * (n + 1) )
    r_x = Vector{Float64}( mult * (n + 1) )
    h_val = Vector{Float64}( mult * (n + 1) )



    move = 0.0
    max_loop = n + 1

    h = (b - a) / (max_loop - 1)

    for i = 1: max_loop
        x[i] = a + move
        val[i] = f(x[i])
        move += h
    end

    fx = ilorazyRoznicowe(x, val);

    move = 0.0
    max_loop *= mult
    h = (b - a) / (max_loop - 1)

    for i = 1: max_loop
        r_x[i] = a + move
        h_val[i] = warNewton(x, fx, r_x[i])
        r_val[i] = f(r_x[i])
        move += h
    end

    plot(r_x, r_val, linewidth=2.0,color = "blue")
    plot(r_x, h_val, linewidth=2.0,color = "red")

end
