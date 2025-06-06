extension IntUpTo on int {
  Range upto(int n) => Range(this, n);
}

class Range with Iterable<int> {
  final int start;
  final int end;
  int _step = 1;

  Range(this.start, this.end);

  void by(int step) => this._step = step;

  @override
  Iterator<int> get iterator => RangeIterator(this.start, this.end, this._step);
}

class RangeIterator implements Iterator<int> {
  final int start;
  final int end;
  final int step;
  int _i = 0;

  RangeIterator(this.start, this.end, this.step) {
    this._i = this.start - 1;
  }

  @override
  int get current => this._i;

  @override
  bool moveNext() {
    // TODO negative step handling.
    if (this._i < this.end) {
      this._i += this.step;
      return true;
    }
    return false;
  }
}
