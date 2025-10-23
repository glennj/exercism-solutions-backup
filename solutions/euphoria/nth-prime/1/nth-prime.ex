-- cheating? using the included primes library
include std/primes.e

public function prime( integer number )
    integer n = 1
    integer p = 2
    while n < number do
        p = next_prime(p + 1)
        n += 1
    end while
    return p
end function
