class RotationalCipher {
  static RegExp upper = RegExp(r'[A-Z]');
  static RegExp lower = RegExp(r'[a-z]');
  static const int code_a = 97;
  static const int code_A = 65;
  static const int alphabet_size = 26;

  String rotate({required String text, required int shiftKey}) {
    return text
        .replaceAllMapped(upper, (m) => shift(m[0]!, shiftKey, code_A))
        .replaceAllMapped(lower, (m) => shift(m[0]!, shiftKey, code_a));
  }

  String shift(String letter, int key, int base) {
    var ascii = letter.codeUnitAt(0);
    var shifted = (((ascii - base) + key) % alphabet_size) + base;
    return String.fromCharCode(shifted);
  }
}
