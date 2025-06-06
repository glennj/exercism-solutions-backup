class Meetup {
  static const one_day = Duration(days: 1);
  static const days = <String>[
    '', // Monday needs index 1
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  String meetup({
      required int year,
      required int month,
      required String week,
      required String dayofweek,
  }) {
    // populate the calendar for this month
    Map<int, List<DateTime>> calendar = {};
    for (var weekday = 1; weekday <= 7; weekday++) {
      calendar[weekday] = [];
    }
    var day = DateTime.utc(year, month, 1);
    while (day.month == month) {
      calendar[day.weekday]!.add(day);
      day = day.add(one_day);
    }

    // get the list of month days for the given day of week
    var weekday = days.indexOf(dayofweek);
    if (weekday == -1) throw ArgumentError('invalid day of week');
    var wantedDays = calendar[weekday]!;

    // find the day for the given week
    var date = switch (week) {
      'first' => wantedDays[0],
      'second' => wantedDays[1],
      'third' => wantedDays[2],
      'fourth' => wantedDays[3],
      'last' => wantedDays.last,
      'teenth' => wantedDays.firstWhere((dt) => dt.day >= 13),
      _ => throw ArgumentError('invalid week parameter'),
    };

    // return just the date part in yyyy-mm-dd format
    return date.toIso8601String().split("T").first;
  }
}
