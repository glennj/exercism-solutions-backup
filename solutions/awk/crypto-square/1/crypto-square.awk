@include "join"

function ceil(x,    y) {
    y = int(x)
    return y == x ? y : y + 1
}

function pad(str, len) {
    return sprintf("%-*s", len, str)
}

{
    cleaned = gensub(/[^[:alnum:]]/, "", "g", tolower($0))

    if (cleaned == "") {
        print ""
        next
    }

    # break string into segments
    size = ceil(sqrt(length(cleaned)))
    n = 0
    while (cleaned != "") {
        segments[++n] = substr(cleaned, 1, size)
        cleaned = substr(cleaned, size + 1)
    }
    segments[n] = pad(segments[n], size)

    # transpose
    for (i = 1; i <= n; i++)
        for (j = 1; j <= size; j++)
            transposed[j] = transposed[j] substr(segments[i], j, 1)

    print join(transposed, 1, length(transposed), " ")
}
