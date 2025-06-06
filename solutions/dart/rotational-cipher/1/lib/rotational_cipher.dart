class RotationalCipher {
  String rotate({required String text, required int shiftKey}) {
    return text
      .replaceAllMapped(RegExp(r'[A-Z]'), (m) => shift(m[0]!, shiftKey, 65))
      .replaceAllMapped(RegExp(r'[a-z]'), (m) => shift(m[0]!, shiftKey, 97));
  }

  String shift(String letter, int key, int base) {
    var ascii = letter.codeUnitAt(0);
    var shifted = (((ascii - base) + key) % 26) + base;
    return String.fromCharCode(shifted);
  }
}
