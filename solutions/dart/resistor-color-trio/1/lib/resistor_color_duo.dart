import 'package:resistor_color_trio/resistor_color.dart';

class ResistorColorDuo {
  final _rc = ResistorColor();

  int value(List<String> colors) =>
      colors.take(2).fold(0, (val, color) => val * 10 + _rc.colorCode(color));
}
