bool isLetter(String char) {
  // Hmm, does this depend on locale?
  return char.compareTo('a') >= 0
      && char.compareTo('z') <= 0;
}

class Pangram {
  bool isPangram(String word) {
    return 26 == word.toLowerCase()
                     .split('')
                     .where(isLetter)
                     .toSet()
                     .length;
  }
}
