module TreasureChest exposing (..)


type TreasureChest treasure
    = TreasureChest String treasure


getTreasure : String -> TreasureChest a -> Maybe a
getTreasure passwordAttempt (TreasureChest password t) =
    if passwordAttempt == password then
        Just t

    else
        Nothing


multiplyTreasure : (a -> List a) -> TreasureChest a -> TreasureChest (List a)
multiplyTreasure multiplier (TreasureChest password t) =
    TreasureChest password (multiplier t)
