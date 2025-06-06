class PrimeFactors {
  List<int> factors(int n) {
    var f = 2;
    var fs = <int>[];
    while (f * f <= n) {
      if (n % f == 0) {
        fs.add(f);
        n ~/= f;
      } else {
        f++;
      }
    }
    if (n > 1) fs.add(n);
    return fs;
  }
}
