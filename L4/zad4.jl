#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#

include("my_module.jl")

using my_module

f(x) = exp(x)
g(x) = x^2 * sin(x)

rysujNnfx(f, 0.0, 1.0, 5)
rysujNnfx(f, 0.0, 1.0, 10)
rysujNnfx(f, 0.0, 1.0, 15)

rysujNnfx(g, -1.0, 1.0 , 5)
rysujNnfx(g, -1.0, 1.0 , 10)
rysujNnfx(g, -1.0, 1.0 , 15)
