function transform(ch)
    ch == '-'                       && return "_"
    'α' ≤ ch ≤ 'ω'                  && return "?"
    (isspace(ch) || isdigit(ch))    && return ""
    isletter(ch) && isuppercase(ch) && return "-$(lowercase(ch))"

    string(ch)
end

clean(str) = [transform(ch) for ch in str] |> join
