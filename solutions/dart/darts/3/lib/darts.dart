import 'dart:math';

extension on double {
  bool get isBullseye => this <= 1;
  bool get isInnerRing => this <= 5;
  bool get isOuterRing => this <= 10;
}

double hypot(double x, double y) => sqrt(x * x + y * y);

const BULLSEYE = 10;
const INNER_RING = 5;
const OUTER_RING = 1;

class Darts {
  int score(double x, double y) {
    var distance = hypot(x, y);
    if (distance.isBullseye) return BULLSEYE;
    if (distance.isInnerRing) return INNER_RING;
    if (distance.isOuterRing) return OUTER_RING;
    return 0;
  }
}
