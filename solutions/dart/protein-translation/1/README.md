# Protein Translation

Welcome to Protein Translation on Exercism's Dart Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Translate RNA sequences into proteins.

RNA can be broken into three-nucleotide sequences called codons, and then translated to a protein like so:

RNA: `"AUGUUUUCU"` => translates to

Codons: `"AUG", "UUU", "UCU"`
=> which become a protein with the following sequence =>

Protein: `"Methionine", "Phenylalanine", "Serine"`

There are 64 codons which in turn correspond to 20 amino acids; however, all of the codon sequences and resulting amino acids are not important in this exercise.
If it works for one codon, the program should work for all of them.
However, feel free to expand the list in the test suite to include them all.

There are also three terminating codons (also known as 'STOP' codons); if any of these codons are encountered (by the ribosome), all translation ends and the protein is terminated.

All subsequent codons after are ignored, like this:

RNA: `"AUGUUUUCUUAAAUG"` =>

Codons: `"AUG", "UUU", "UCU", "UAA", "AUG"` =>

Protein: `"Methionine", "Phenylalanine", "Serine"`

Note the stop codon `"UAA"` terminates the translation and the final methionine is not translated into the protein sequence.

Below are the codons and resulting amino acids needed for the exercise.

| Codon              | Amino Acid    |
| :----------------- | :------------ |
| AUG                | Methionine    |
| UUU, UUC           | Phenylalanine |
| UUA, UUG           | Leucine       |
| UCU, UCC, UCA, UCG | Serine        |
| UAU, UAC           | Tyrosine      |
| UGU, UGC           | Cysteine      |
| UGG                | Tryptophan    |
| UAA, UAG, UGA      | STOP          |

Learn more about [protein translation on Wikipedia][protein-translation].

[protein-translation]: https://en.wikipedia.org/wiki/Translation_(biology)

## Source

### Created by

- @glennj

### Based on

Tyler Long