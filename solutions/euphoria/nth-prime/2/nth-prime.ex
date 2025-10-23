/*  *
    * OK, my implementation is faster than the stdlib version.
    * How is that possible?
    *   
    * 1. using `prime_builtin`
    *   
    *   $ time eutest
    *   
    *   interpreting t_nth-prime.e:
    *     passed: first prime
    *     passed: second prime
    *     passed: sixth prime
    *     passed: big prime
    *     4 tests run, 4 passed, 0 failed, 100% success
    *   
    *   Test results summary:
    *   Files (run: 1) (failed: 0) (100% success)
    *   
    *   real    0m0.682s
    *   user    0m0.466s
    *   sys     0m0.116s
    *   
    *   
    * 2. using `prime_from_scratch`
    *
    *   $ time eutest
    *   
    *   interpreting t_nth-prime.e:
    *     passed: first prime
    *     passed: second prime
    *     passed: sixth prime
    *     passed: big prime
    *     4 tests run, 4 passed, 0 failed, 100% success
    *   
    *   Test results summary:
    *   Files (run: 1) (failed: 0) (100% success)
    *   
    *   real    0m0.418s
    *   user    0m0.247s
    *   sys     0m0.070s
    *   
    */

include std/primes.e
include std/math.e

public function prime( integer number )
    return prime_builtin(number)
    -- return prime_from_scratch(number)
end function

-- ------------------------------------------------------------
-- cheating? using the included primes library
function prime_builtin( integer number )
    integer n = 1
    integer p = 2
    while n < number do
        p = next_prime(p + 1)
        n += 1
    end while
    return p
end function

-- ------------------------------------------------------------
sequence my_primes = {2, 3}

function my_is_prime(integer candidate)
    for i = 1 to length(my_primes) do
        integer p = my_primes[i]
        if p * p > candidate then return 1 end if
        if mod(candidate, p) = 0 then return 0 end if
    end for
    return 1
end function

function my_next_prime()
    integer p = my_primes[$]
    loop do
        p += 2
        until my_is_prime(p)
    end loop
    return p
end function

function prime_from_scratch(integer number)
    while number > length(my_primes) do
        my_primes &= my_next_prime()
    end while

    return my_primes[number]
end function
