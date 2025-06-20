const DigitValue = <bool, List<int>>{
  false: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
  true: [0, 2, 4, 6, 8, 1, 3, 5, 7, 9],
};

class Luhn {
  bool valid(String input) {
    var cleaned = input.replaceAll(RegExp(r'\s'), '');
    if (RegExp(r'\D').hasMatch(cleaned) || cleaned.length == 1)
      return false;

    /* using records requires pubspec.yaml changed from
     *    environment:
     *      sdk: '>=2.18.0 <3.0.0'
     * to
     *    environment:
     *      sdk: '>=3.0.0'
     */
    var (sum, _) = cleaned
        .split('')
        .map((digit) => int.parse(digit))
        .toList()
        .reversed
        .fold(
          (0, false),
          (acc, digit) {
            var (sum, doubled) = acc;
            return (sum + DigitValue[doubled]![digit], !doubled);
          });
    return sum % 10 == 0;
  }
}
