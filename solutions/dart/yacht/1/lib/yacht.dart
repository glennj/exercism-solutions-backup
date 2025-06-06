import 'package:yacht/categories.dart';

typedef Frequency = Map<int, int>;

class Yacht {
  List<int> dice;
  Yacht(this.dice);

  int score(Category category) {
    Frequency freq = {};
    dice.forEach((die) => freq[die] = (freq[die] ?? 0) + 1);

    return switch (category) {
      Category.ones => single(freq, 1),
      Category.twos => single(freq, 2),
      Category.threes => single(freq, 3),
      Category.fours => single(freq, 4),
      Category.fives => single(freq, 5),
      Category.sixes => single(freq, 6),
      Category.full_house => full_house(freq),
      Category.four_of_a_kind => four_kind(freq),
      Category.little_straight => straight(freq, [1, 2, 3, 4, 5]),
      Category.big_straight => straight(freq, [2, 3, 4, 5, 6]),
      Category.yacht => yacht(freq),
      Category.choice => sum(),
    };
  }

  int single(Frequency freq, int die) => die * (freq[die] ?? 0);

  int full_house(Frequency freq) {
    if (freq.containsValue(2) && freq.containsValue(3)) {
      return freq.entries
          .fold(0, (sum, entry) => sum + entry.key * entry.value);
    }
    return 0;
  }

  int four_kind(Frequency freq) {
    for (final entry in freq.entries) {
      if (entry.value >= 4) {
        return 4 * entry.key;
      }
    }
    return 0;
  }

  int straight(Frequency freq, List<int> members) =>
      members.every((die) => freq.containsKey(die)) ? 30 : 0;

  int yacht(Frequency freq) => freq.length == 1 ? 50 : 0;

  int sum() => dice.fold(0, (sum, die) => sum + die);
}
