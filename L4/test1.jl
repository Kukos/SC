#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#

include("my_module.jl")

using my_module

f(x) = x + 9
g(x) = x^2 - 9

rysujNnfx(f, -10.0, 10.0, 3)
rysujNnfx(f, -10.0, 10.0, 20)

rysujNnfx(g, -10.0, 10.0, 3)
rysujNnfx(g, -10.0, 10.0, 20)
