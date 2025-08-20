# Determine if a list of YYYY-MM-DD birthdates contains
# any shared birthdays.

proc sharedBirthday {birthdays} {
    array set counts {}
    foreach date $birthdays {
        set md [string range $date 5 end]
        if {[info exists counts($md)]} {
            return true
        }
        set counts($md) true
    }
    return false
}

# Generate a list of $count random dates in YYYY-MM-DD form.
# Do not include leap years.

proc randomBirthdates {count} {
    set thisYear [clock format [clock seconds] -format %Y]

    set randomDate {{} {
        upvar thisYear thisYear
        set isLeap {{year} {
            expr {$year % 4 == 0 && ($year % 100 != 0 || $year % 400 == 0)}
        }}

        set year 0
        while {[apply $isLeap $year]} {
            set year [expr {int(rand() * ($thisYear - 1900)) + 1900}]
        }
        set dayOfYear [expr {int(rand() * 365) + 1}]
        set time [clock scan "$year:$dayOfYear" -format {%Y:%j}]
        clock format $time -format {%Y-%m-%d}
    }}

    set dates {}
    for {set i 0} {$i < $count} {incr i} {
        lappend dates [apply $randomDate]
    }
    return $dates
}

# Estimate the probability that 2 people in a group of given size
# have the same birthday.

proc estimatedProbabilityOfSharedBirthday {size} {
    if {$size < 2} {
        # need at least 2 people to _share_ a birthday
        return 0
    }
    set shared 0
    set iterations 9876
    for {set i 0} {$i < $iterations} {incr i} {
        set dates [randomBirthdates $size]
        if {[sharedBirthday $dates]} {
            incr shared
        }
    }
    expr {100.0 * $shared / $iterations}
}
