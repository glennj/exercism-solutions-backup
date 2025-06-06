import 'package:yacht/categories.dart';

typedef Count = Map<int, int>;

class Yacht {
  List<int> dice;
  Yacht(this.dice);

  int score(Category category) {
    Count count = {};
    dice.forEach((die) => count[die] = (count[die] ?? 0) + 1);

    return switch (category) {
      Category.ones => single(count, 1),
      Category.twos => single(count, 2),
      Category.threes => single(count, 3),
      Category.fours => single(count, 4),
      Category.fives => single(count, 5),
      Category.sixes => single(count, 6),
      Category.full_house => full_house(count),
      Category.four_of_a_kind => four_kind(count),
      Category.little_straight => straight([1, 2, 3, 4, 5]),
      Category.big_straight => straight([2, 3, 4, 5, 6]),
      Category.yacht => yacht(count),
      Category.choice => sum(),
    };
  }

  int single(Count count, int die) => die * (count[die] ?? 0);

  int full_house(Count count) =>
    count.containsValue(2) && count.containsValue(3) ? sum() : 0;

  int four_kind(Count count) {
    for (final entry in count.entries) {
      if (entry.value >= 4) {
        return 4 * entry.key;
      }
    }
    return 0;
  }

  int straight(List<int> members) =>
      dice.toSet().containsAll(members) ? 30 : 0;

  int yacht(Count count) => count.length == 1 ? 50 : 0;

  int sum() => dice.fold(0, (sum, die) => sum + die);
}
