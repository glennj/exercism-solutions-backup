class Meetup {
  static const days = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];

  String meetup({
    required int year,
    required int month,
    required String week,
    required String dayofweek,
  }) {
    int dow = days.indexOf(dayofweek) + 1;
    if (dow == 0) throw ArgumentError('invalid day of week');

    var targetDates = List.generate(32, (day) => DateTime.utc(year, month, day))
        .where((date) => date.month == month && date.weekday == dow);

    var date = switch (week) {
      'first' => targetDates.elementAt(0),
      'second' => targetDates.elementAt(1),
      'third' => targetDates.elementAt(2),
      'fourth' => targetDates.elementAt(3),
      'last' => targetDates.last,
      'teenth' => targetDates.firstWhere((dt) => dt.day >= 13),
      _ => throw ArgumentError('invalid week parameter'),
    };

    // return just the date part in yyyy-mm-dd format
    return date.toIso8601String().split("T").first;
  }
}
