cleanupname(name) = replace(name, "-" => " ") |> strip

firstletter(name) = cleanupname(name) |> (s -> first(s, 1))

initial(name) = firstletter(name) * "." |> uppercase

couple(name1, name2) = join(["❤", initial(name1), " + ", initial(name2), "❤"], " ")
