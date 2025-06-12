module List.Utils exposing (..)


take : Int -> List a -> List a
take n list =
    let takeRec elems taken =
            case elems of
                [] -> taken
                x :: xs ->
                    if List.length taken == n then
                        taken
                    else
                        takeRec xs (taken ++ [x])
    in
        takeRec list []
