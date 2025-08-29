{
    for (i = 1; i <= NF; i++) {
        mtx[NR][i] = $i
        rowmax[NR] = i == 1 ? $1 : max(rowmax[NR], $i)
        colmin[i] = NR == 1 ? $i : min(colmin[i], $i)
    }
}

function max(a, b) { return a > b ? a : b }
function min(a, b) { return a < b ? a : b }

END {
    for (r = 1; r <= length(mtx); r++)
        for (c = 1; c <= length(mtx[1]); c++)
            if (mtx[r][c] == rowmax[r] && mtx[r][c] == colmin[c])
                print r, c
}
