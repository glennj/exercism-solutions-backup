import 'dart:math' as math;

extension MaxFromIntList on List<int> {
  int max() => this.reduce(math.max);
}

class HighScores {
  List<int> scores;

  HighScores(this.scores);

  int latest() => this.scores.last;
  int personalBest() => this.scores.max();

  List<int> personalTopThree() {
    // cascade notation
    List<int> sorted = List.from(this.scores)..sort((a, b) => b - a);
    return sorted.take(3).toList();
  }
}
