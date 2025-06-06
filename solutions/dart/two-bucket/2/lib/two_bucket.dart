import 'dart:math';

typedef Result = ({int moves, String goalBucket, int otherBucket});

class Bucket {
  String name;
  int size;
  int amount = 0;

  Bucket(this.name, this.size);

  bool isFull() => amount == size;
  bool isEmpty() => amount == 0;
  void fill() => amount = size;
  void empty() => amount = 0;
  int availability() => size - amount;
  void pourInto(Bucket other) {
    var quantity = min(amount, other.availability());
    amount -= quantity;
    other.amount += quantity;
  }
  String toString() => "Bucket(${name}, ${size}, ${amount})";
}

class TwoBucket {
  late Bucket first;
  late Bucket second;
  late int goal;

  TwoBucket({
      required int bucketOne,
      required int bucketTwo,
      required int goal,
      required String startBucket
  }) {
    this.first = Bucket("one", bucketOne);
    this.second = Bucket("two", bucketTwo);
    this.goal = goal;
    if (startBucket == "two") {
      var tmp = this.first;
      this.first = this.second;
      this.second = tmp;
    }
  }

  Result measure() {
    _validate();

    first.fill();
    second.empty();
    var moves = 1;

    if (goal == second.size) {
      second.fill();
      moves++;
    }

    while (true) {
      if (goal == first.amount)  return _result(moves, first, second);
      if (goal == second.amount) return _result(moves, second, first);

      if (first.isEmpty())       first.fill();
      else if (second.isFull())  second.empty();
      else                       first.pourInto(second);

      moves++;
    }
  }

  Result _result(int moves, Bucket winner, Bucket loser) {
    return (moves: moves, goalBucket: winner.name, otherBucket: loser.amount);
  }

  void _validate() {
    if (goal > max(first.size, second.size)) {
      throw ArgumentError('Measurement is impossible: goal too big');
    }
    var gcd = first.size.gcd(second.size);
    if (gcd != 1 && goal % gcd != 0) {
      throw ArgumentError('Measurement is impossible: goal is unsatisfiable');
    }
  }
}
