include lib/resistor-color.e
include lib/resistor-color-duo.e
include std/math.e

public function value( sequence colors )
    integer val = resistorValue(colors[1..2]) * power(10, colorCode(colors[3]))

    sequence prefixes = {"", "kilo", "mega", "giga"}
    integer idx = 1

    while val > 0 and mod(val, 1000) = 0 do
        idx += 1
        val /= 1000
    end while

    return sprintf("%d %sohms", {val, prefixes[idx]})
end function
