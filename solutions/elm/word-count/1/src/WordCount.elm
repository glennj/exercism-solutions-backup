module WordCount exposing (wordCount)

import Dict exposing (Dict)


type State
    = SeekingStart
    | AccumulatingWord


wordCount : String -> Dict String Int
wordCount sentence =
    getWords SeekingStart sentence [] []
        |> List.foldl dictIncr Dict.empty


dictIncr : comparable -> Dict comparable Int -> Dict comparable Int
dictIncr key dict =
    Dict.update key (\val -> 1 + Maybe.withDefault 0 val |> Just) dict


getWords : State -> String -> List Char -> List String -> List String
getWords state sentence wordChars words =
    case ( state, String.uncons sentence ) of
        ( SeekingStart, Nothing ) ->
            words

        ( AccumulatingWord, Nothing ) ->
            toWord wordChars :: words

        ( SeekingStart, Just ( c, cs ) ) ->
            if Char.isAlpha c || Char.isDigit c then
                getWords AccumulatingWord cs [ c ] words

            else
                getWords SeekingStart cs [] words

        ( AccumulatingWord, Just ( c, cs ) ) ->
            if Char.isAlpha c || Char.isDigit c || c == '\'' then
                getWords AccumulatingWord cs (c :: wordChars) words

            else
                getWords SeekingStart cs [] (toWord wordChars :: words)


toWord : List Char -> String
toWord wordChars =
    let
        trimSuffix suffix word =
            if String.endsWith suffix word then
                trimSuffix suffix (String.dropRight (String.length suffix) word)

            else
                word
    in
    wordChars
        |> List.reverse
        |> String.fromList
        |> String.toLower
        |> trimSuffix "'"
