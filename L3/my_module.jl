module my_module

#=
    Author: Michal Kukowski
    email: michalkukowski10@gmail.com
=#

export mbisekcji
export mstycznych
export msiecznych

#=
    Function find roots of function @f on range [@a;@b]

    PARAMS
    @IN f - function
    @IN a - start range
    @IN b - end range
    @IN delta - accurancy of range
    @IN epsilon - accurancy of value

    RETURN:
    tuple : (%r, value_r, %it_num, %errno)

    %r - root
    $value_r - f(r)
    %it_num - number of steps
    %errno (    0 - success
                sign(f(@a)) == sign(f(@b))
           )
=#
function mbisekcji(f, a :: Float64, b :: Float64, delta :: Float64, epsilon :: Float64)

    local r :: Float64 # root
    local mid :: Float64 # range middle

    local value_a :: Float64 # f(a)
    local value_b :: Float64 # f(b)
    local value_r :: Float64 # f(c)

    local it_num :: Int # number os steps
    local errno :: Int # error number

    r = 0
    value_r = 0
    it_num = 0
    errno = 0


    value_a = f(a)
    value_b = f(b)

    if sign(value_a) == sign(value_b)
        errno = 1
        return (r, value_r, it_num, errno)
    end

    mid = b - a

    while mid > epsilon

        it_num += 1

        mid /= 2.0
        r = a + mid
        value_r = f(r)

        if abs(mid) < delta || abs(value_r) < epsilon
            return (r, value_r, it_num, errno)
        end

        if sign(value_r) != sign(value_a)
            b = r
            value_b = value_r
        else
            a = r
            value_a = value_r
        end
    end

    return (r, value_r, it_num. errno)
end

#=
    Function find roots of function @f

    PARAMS
    @IN f - function
    @IN d - deriv of f
    @IN x0 - estimation on begining
    @IN delta - accurancy of range
    @IN epsilon - accurancy of value
    @IN max_it - maximum steps

    RETURN:
    tuple : (%r, value_r, %it_num, %errno)

    %r - root
    $value_r - f(r)
    %it_num - number of steps
    %errno (    0 - success
                1 after max_it steps hasn't %epsilon
                2 abs(df(x0))) < epsilon
           )
=#
function mstycznych(f, df, x0 :: Float64, delta :: Float64, epsilon :: Float64, max_it :: Int)

    local r :: Float64 # root
    local x :: Float64

    local value_r :: Float64 # f(r)
    local value_x :: Float64 # f(x)

    local it_num :: Int # number of steps
    local errno :: Int # error number

    r = x0
    value_r = f(r)
    it_num = 0
    errno = 0

    if abs(df(r)) < epsilon
        errno = 2
        return (r, value_r, it_num, errno)
    end

    for it_num = 1: max_it

        x = r - (value_r / df(r) )
        value_r = f(x)

        if abs(r - x) < delta || abs(value_r) < epsilon
            r = x
            return (r, value_r, it_num, errno)
        end

        r = x
    end

    if abs(value_r) > epsilon
        errno = 1
    end

    return (r, value_r, it_num, errno)
end

#=
    Function find roots of function @f

    PARAMS
    @IN f - function
    @IN x0 - estimation on begining
    @IN x1 - estimation on begining
    @IN delta - accurancy of range
    @IN epsilon - accurancy of value
    @IN max_it - maximum steps

    RETURN:
    tuple : (%r, value_r, %it_num, %errno)

    %r - root
    $value_r - f(r)
    %it_num - number of steps
    %errno (    0 - success
                1 after max_it steps hasn't %epsilon
           )
=#
function msiecznych(f, x0 :: Float64, x1 :: Float64, delta :: Float64, epsilon :: Float64, max_it :: Int)

    local a :: Float64
    local b :: Float64
    local s :: Float64

    local value_a :: Float64 # f(a)
    local value_b :: Float64 # f(b)

    local it_num :: Int # number of steps
    local errno :: Int # error number

    a = x0
    b = x1

    value_a = f(a)
    value_b = f(b)

    it_num = 0
    errno = 0

    for it_num = 1: max_it

        if value_a > value_b
            # SWAP (a,b)
            temp = a
            a = b
            b = temp

            #SWAP(value_a, value_b)
            temp = value_a
            value_a = value_b
            value_b = temp
        end

        s = (b - a) / (value_b - value_a)
        b = a
        value_b = value_a

        a -= value_a * s
        value_a = f(a)

        if abs(value_a) < epsilon || abs(b - a) < delta
            return (a, value_a, it_num, errno)
        end
    end

    if abs(value_a) > epsilon && abs(b - a) > delta
        errno = 1
    end

    return (a, value_a, it_num, errno)
end

end # end my_module
