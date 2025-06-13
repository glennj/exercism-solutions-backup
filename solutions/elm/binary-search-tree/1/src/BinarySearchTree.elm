module BinarySearchTree exposing (BinaryTree(..), makeTree, sort)


type BinaryTree
    = Empty
    | Tree BinaryTree Int BinaryTree


makeTree : List Int -> BinaryTree
makeTree data =
    let
        insert datum tree =
            case tree of
                Empty ->
                    Tree Empty datum Empty

                Tree left value right ->
                    if datum <= value then
                        Tree (insert datum left) value right

                    else
                        Tree left value (insert datum right)
    in
    List.foldl insert Empty data


sort : List Int -> List Int
sort data =
    let
        values tree =
            case tree of
                Empty ->
                    []

                Tree left value right ->
                    values left ++ [ value ] ++ values right
    in
    makeTree data |> values
