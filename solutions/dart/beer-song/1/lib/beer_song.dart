extension on String {
  String ucFirst() {
    if (this.length < 2)
      return this.toUpperCase();
    else
      return this[0].toUpperCase() + this.substring(1);
  }
}

class BeerSong {
  static const MAX = 99;
  static const WHERE = 'on the wall';

  List<String> recite(int startVerse, int numVerses) {
    return List
        .generate(numVerses, (i) => startVerse - i)
        .fold(<String>[], (vs, n) => vs..addAll(['', _first(n), _second(n)]))
        .sublist(1);
  }

  String _first(int n) {
    var b = _bottles(n);
    return '${b.ucFirst()} $WHERE, $b.';
  }

  String _second(int n) {
    var b = '${_bottles(n - 1)} $WHERE.';
    if (n > 0)
      return 'Take ${n == 1 ? "it" : "one"} down and pass it around, $b';
    else
      return 'Go to the store and buy some more, $b';
  }

  String _bottles(int n) {
    if (n < 0) n = MAX;
    return '${n == 0 ? "no more" : n} bottle${n == 1 ? "" : "s"} of beer';
  }
}
