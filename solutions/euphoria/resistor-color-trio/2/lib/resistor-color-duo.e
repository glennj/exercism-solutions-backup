include lib/resistor-color.e

public function resistorValue( sequence colors )
    return colorCode(colors[1]) * 10 + colorCode(colors[2])
end function
