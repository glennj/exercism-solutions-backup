typedef Matrix = List<List<int>>;

class GameOfLife {
  Matrix mtx;

  GameOfLife(this.mtx);

  // TODO: return a clone or a frozen version.
  Matrix matrix() => mtx;

  Matrix tick() {
    Matrix next = _newMatrix();

    for (var row = 0; row < mtx.length; row++) {
      for (var col = 0; col < mtx[row].length; col++) {
        next[row][col] = switch (_countNeighbours(row, col)) {
          3 => 1,
          2 => mtx[row][col],
          _ => 0,
        };
      }
    }

    mtx = next;
    return next;
  }

  Matrix _newMatrix() =>
      List.generate(mtx.length, (i) => List.filled(mtx[i].length, 0));

  int _countNeighbours(int row, int col) {
    var count = 0;

    for (var delta in [[-1,-1], [-1,0], [-1,1], [0,-1], [0,1], [1,-1], [1,0], [1,1]]) {
      var dr = row + delta[0];
      var dc = col + delta[1];
      if (0 <= dr && dr < mtx.length &&
          0 <= dc && dc < mtx[row].length) { count += mtx[dr][dc]; }
    }

    return count;
  }
}
