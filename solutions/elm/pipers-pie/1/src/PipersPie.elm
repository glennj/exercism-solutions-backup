module PipersPie exposing (doubleFactorial, factorial, pipersPi)


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
        halfPi sum k =
            if k > limit then
                sum

            else
                let
                    term =
                        toFloat (factorial k) / toFloat (doubleFactorial (2 * k + 1))
                in
                halfPi (sum + term) (k + 1)
    in
    halfPi 0 0 * 2
