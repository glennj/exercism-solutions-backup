typedef IntFn = int Function(int x);

int ident(int n) => n;
int square(int n) => n * n;

class DifferenceOfSquares {
  int squareOfSum(int n) => doSum(n, ident, square);
  int sumOfSquares(int n) => doSum(n, square, ident);

  int doSum(int n, IntFn innerFn, IntFn outerFn) {
    Iterable<int> range = Iterable.generate(n); // range of [0, ... n-1]
    int sum = range.fold(0, (s, i) => s + innerFn(i + 1));
    return outerFn(sum);
  }

  int differenceOfSquares(int n) {
    return (sumOfSquares(n) - squareOfSum(n)).abs();
  }
}
