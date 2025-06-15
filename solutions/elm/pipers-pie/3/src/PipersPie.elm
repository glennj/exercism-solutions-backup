module PipersPie exposing (doubleFactorial, factorial, pipersPi)


factorialHelper : Int -> Int -> Int -> Int
factorialHelper step acc num =
    if num <= 1 then
        acc

    else
        factorialHelper step (acc * num) (num - step)


factorial : Int -> Int
factorial n =
    factorialHelper 1 1 n


doubleFactorial : Int -> Int
doubleFactorial n =
    factorialHelper 2 1 n


pipersPi : Int -> Float
pipersPi limit =
    let
        halfPi : Float -> Int -> Float
        halfPi sum k =
            if k > limit then
                sum

            else
                let
                    numerator = toFloat (factorial k)
                    denominator = toFloat (doubleFactorial (2 * k + 1))
                    newSum = sum + numerator / denominator
                in
                if sum == newSum then
                    -- this is as accurate as we're going to get
                    sum

                else
                    halfPi newSum (k + 1)
    in
    2 * halfPi 0 0
