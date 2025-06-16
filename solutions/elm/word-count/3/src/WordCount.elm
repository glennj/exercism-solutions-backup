module WordCount exposing (wordCount)

import Dict exposing (Dict)


type State
    = SeekingStart
    | AccumulatingWord


wordCount : String -> Dict String Int
wordCount sentence =
    sentence
        |> getWords SeekingStart [] []
        |> List.foldl dictIncr Dict.empty


dictIncr : comparable -> Dict comparable Int -> Dict comparable Int
dictIncr key dict =
    Dict.update key (\val -> 1 + Maybe.withDefault 0 val |> Just) dict


getWords : State -> List Char -> List String -> String -> List String
getWords state wordChars words sentence =
    case ( state, String.uncons sentence ) of
        ( SeekingStart, Nothing ) ->
            words

        ( AccumulatingWord, Nothing ) ->
            toWord wordChars :: words

        ( SeekingStart, Just ( char, rest ) ) ->
            if Char.isAlpha char || Char.isDigit char then
                getWords AccumulatingWord [ char ] words rest

            else
                getWords SeekingStart [] words rest

        ( AccumulatingWord, Just ( char, rest ) ) ->
            if Char.isAlpha char || Char.isDigit char || char == '\'' then
                getWords AccumulatingWord (char :: wordChars) words rest

            else
                getWords SeekingStart [] (toWord wordChars :: words) rest


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
