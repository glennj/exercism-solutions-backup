# Diffie-Hellman

Welcome to Diffie-Hellman on Exercism's JavaScript Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Diffie-Hellman key exchange.

Alice and Bob use Diffie-Hellman key exchange to share secrets.
They start with prime numbers, pick private keys, generate and share public keys, and then generate a shared secret key.

## Step 0

The test program supplies prime numbers p and g.

## Step 1

Alice picks a private key, a, greater than 1 and less than p.
Bob does the same to pick a private key b.

## Step 2

Alice calculates a public key A.

    A = gᵃ mod p

Using the same p and g, Bob similarly calculates a public key B from his private key b.

## Step 3

Alice and Bob exchange public keys.
Alice calculates secret key s.

    s = Bᵃ mod p

Bob calculates

    s = Aᵇ mod p

The calculations produce the same result!
Alice and Bob now share secret s.

## Source

### Created by

- @matthewmorgan

### Contributed to by

- @ankorGH
- @jagdish-15
- @rchavarria
- @serixscorpio
- @SleeplessByte
- @tejasbubane

### Based on

Wikipedia, 1024 bit key from www.cryptopp.com/wiki. - https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange