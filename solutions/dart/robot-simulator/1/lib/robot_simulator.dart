import 'package:robot_simulator/orientation.dart';
import 'package:robot_simulator/position.dart';

extension on Position {
  void add(int dX, int dY) {
    this.x += dX;
    this.y += dY;
  }
}

class Robot {
  Position position;
  Orientation orientation;

  Robot(this.position, this.orientation);

  void move(String instructions) {
    for (var instruction in instructions.split('')) {
      switch (instruction) {
        case 'R':
          _turn(1);
          break;
        case 'L':
          _turn(-1);
          break;
        case 'A':
          switch (this.orientation) {
            case Orientation.north: this.position.add(0, 1); break;
            case Orientation.east:  this.position.add(1, 0); break;
            case Orientation.south: this.position.add(0, -1); break;
            case Orientation.west:  this.position.add(-1, 0); break;
            default: break;
          }
          break;
        default:
          throw Exception('Invalid instruction: $instruction');
      }
    }
  }

  void _turn(int direction) {
    var orientations = Orientation.values;
    var nextIdx = (this.orientation.index + direction) % orientations.length;
    this.orientation = orientations[nextIdx];
  }
}
