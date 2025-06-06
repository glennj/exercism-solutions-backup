import 'dart:math';

class LargestSeriesProduct {
  int largestProduct(String number, int span) {
    if (span < 0)
      throw ArgumentError("span must not be negative");
    if (span > number.length)
      throw ArgumentError("span must be smaller than string length");
    
    var digits = number.codeUnits.map((c) => c - 48).toList();  // ASCII `0`
    if (digits.any((d) => d < 0 || d > 9))
      throw ArgumentError("digits input must only contain digits");

    int lsp = 0;
    for (var i = 0; i <= digits.length - span; i++) {
      lsp = max(lsp, digits.sublist(i, i + span).product()); 
    }
    return lsp;
  }
}

extension ListProduct on List {
  int product<T extends int>() => fold(1, (prod, n) => (prod * n).toInt());
}