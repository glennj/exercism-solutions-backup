############################################################
# This is a translation of my Tcl solution.
#       https://exercism.org/tracks/tcl/exercises/killer-sudoku-helper/solutions/glennj
# AWK's array handling makes this much more awkward.
############################################################

@include "join"

{
    print combinations($1, $2, concatenate(3, NF))
}

# A recursive function.
# Returns the valid combinations as a string, newline separated,
# with the combinations sorted.
#
# ex: combinations(22, 3, "")  => "5 8 9\n6 7 9"
#     combinations(22, 3, "5") => "6 7 9"
#
function combinations(sum, size, excluded,
                i, j, results, subcombinations, scs, c, n, res, sep) {

    if (size == 1) {
        if (1 <= sum && sum <= 9 && index(excluded, sum) == 0) {
            return sum
        }
    } else {
        results[1] = ""; delete results[1]    # initialize an array

        for (i = 1; i <= 9; i++) {
            if (index(excluded, i) == 0 && sum - i > 0) {
                subcombinations = combinations(sum - i, size - 1, excluded "" i)
                n = split(subcombinations, scs, "\n")
                for (j = 1; j <= n; j++) {
                    results[sortString(scs[j] " " i)] = 1
                }
            }
        }

        if (length(results) > 0) {
            n = asorti(results)
            return join(results, 1, n, "\n")
        }
    }
}

# Sort a string of digits.
#
# ex: sortString("4 3 2 1") => "1 2 3 4"
#
function sortString(digitString,    n, digits, i, res) {
    n = split(digitString, digits)
    asort(digits)
    return join(digits, 1, n)
}

# Concatenate a range of fields in this record.
#
function concatenate(start, stop,   i, res) {
    for (i = start; i <= stop; i++)
        res = res $i
    return res
}
