module Anagram exposing (detect)


detect : String -> List String -> List String
detect word candidates =
    let
        toKey = String.toList >> List.sort >> String.fromList

        target = String.toLower word
        targKey = toKey target

        findAnagrams cands anagrams =
            case cands of
                [] ->
                    List.reverse anagrams

                c :: cs ->
                    let
                        lc = String.toLower c
                    in
                    if target /= lc && targKey == toKey lc then
                        findAnagrams cs (c :: anagrams)

                    else
                        findAnagrams cs anagrams
    in
    findAnagrams candidates []
