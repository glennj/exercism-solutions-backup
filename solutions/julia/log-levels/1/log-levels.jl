function message(msg)
    text_parts = Iterators.drop(split(msg, ":"), 1)
    strip(join(text_parts, ":"))
end

function log_level(msg)
    colon_pos = first(findfirst(":", msg))
    lowercase(msg[2:colon_pos - 2])
end

# reformat(msg) = string(message(msg), " (", log_level(msg), ")")
reformat(msg) = "$(message(msg)) ($(log_level(msg)))"
