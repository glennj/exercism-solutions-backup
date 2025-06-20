module TwelveDays exposing (recite)


nthNum number =
    case number of
        1 -> "first"
        2 -> "second"
        3 -> "third"
        4 -> "fourth"
        5 -> "fifth"
        6 -> "sixth"
        7 -> "seventh"
        8 -> "eighth"
        9 -> "ninth"
        10 -> "tenth"
        11 -> "eleventh"
        12 -> "twelfth"
        _ -> ""


gift number =
    case number of
        1 -> "and a Partridge in a Pear Tree"
        2 -> "two Turtle Doves"
        3 -> "three French Hens"
        4 -> "four Calling Birds"
        5 -> "five Gold Rings"
        6 -> "six Geese-a-Laying"
        7 -> "seven Swans-a-Swimming"
        8 -> "eight Maids-a-Milking"
        9 -> "nine Ladies Dancing"
        10 -> "ten Lords-a-Leaping"
        11 -> "eleven Pipers Piping"
        12 -> "twelve Drummers Drumming"
        _ -> ""


recite : Int -> Int -> List String
recite start stop =
    List.range start stop |> List.map verse


verse number =
    let
        gifts n acc =
            if n == 0 then
                List.reverse acc |> String.join ", "
            else
                gifts (n - 1) (gift n :: acc)

        identity x = x

        giftList =
            gifts number []
                |> if n == 1 then String.replace " and " " " else identity


    in
    "On the "
        ++ nthNum number
        ++ " day of Christmas my true love gave to me: "
        ++ gifts number []
        ++ "."
