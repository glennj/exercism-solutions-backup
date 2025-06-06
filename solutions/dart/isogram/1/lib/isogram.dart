//final ALPHA = RegExp(r'\p{Letter}', caseSensitive: false);
final ALPHA = RegExp(r'[a-z]');

extension on String {
  bool isLetter() => ALPHA.hasMatch(this);
}

class Isogram {
  bool isIsogram(String word) {
    var seen = Set<String>();
    for (var letter in word.toLowerCase().split('')) {
      if (letter.isLetter()) {
        if (seen.contains(letter)) return false;
        seen.add(letter);
      }
    }
    return true;
  }
}
