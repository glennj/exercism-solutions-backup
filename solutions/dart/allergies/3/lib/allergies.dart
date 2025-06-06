import 'int_extensions.dart';
import 'range.dart';

const allergens = <String>[
  'eggs',
  'peanuts',
  'shellfish',
  'strawberries',
  'tomatoes',
  'chocolate',
  'pollen',
  'cats',
];

class Allergies {
  List<String> list(int code) => Range(0, allergens.length - 1)
      .where((i) => code.isBitSetAt(i))
      .map((i) => allergens[i])
      .toList();

  bool allergicTo(String allergen, int code) => list(code).contains(allergen);
}
