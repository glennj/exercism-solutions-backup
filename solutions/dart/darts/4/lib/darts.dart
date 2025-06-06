import 'dart:math';

double hypot(num x, num y) => sqrt(x * x + y * y);

extension on double {
  bool get inBullseye => this <= 1;
  bool get inInnerRing => this > 1 && this <= 5;
  bool get inOuterRing => this > 5 && this <= 10;
}

const BULLSEYE = 10;
const INNER_RING = 5;
const OUTER_RING = 1;

class Darts {
  int score(double x, double y) {
    var distance = hypot(x, y);
    if (distance.inBullseye) return BULLSEYE;
    if (distance.inInnerRing) return INNER_RING;
    if (distance.inOuterRing) return OUTER_RING;
    return 0;
  }
}
