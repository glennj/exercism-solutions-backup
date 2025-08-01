const Nth = [
  "first", "second", "third", "fourth", "fifth", "sixth",
  "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth",
];

const Gifts = [
  'a Partridge in a Pear Tree.',
  'two Turtle Doves,',
  'three French Hens,',
  'four Calling Birds,',
  'five Gold Rings,',
  'six Geese-a-Laying,',
  'seven Swans-a-Swimming,',
  'eight Maids-a-Milking,',
  'nine Ladies Dancing,',
  'ten Lords-a-Leaping,',
  'eleven Pipers Piping,',
  'twelve Drummers Drumming,',
];

class TwelveDays {
  String recite(int first, int last) =>
      List.generate(last - first + 1, (i) => first + i - 1)
          .map(day)
          .join('\n');

  String day(int n) {
    var result = StringBuffer('On the ${Nth[n]} day of Christmas my true love gave to me:');
    for (var i = n; i >= 0; i--) {
      result
        ..write(i == 0 && n > 0 ? " and" : "")
        ..write(" ")
        ..write(Gifts[i]);
    }
    return result.toString();
  }
}
