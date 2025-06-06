const int size = 8;

class Queen {
  int rank = 0, file = 0;
  Queen(int rank, int file) {
    if (rank < 0) throw new AssertionError('row not positive');
    if (rank >= size) throw new AssertionError('row not on board');
    if (file < 0) throw new AssertionError('column not positive');
    if (file >= size) throw new AssertionError('column not on board');
    this.rank = rank;
    this.file = file;
  }

  bool canAttack(Queen other) =>
    this.rank == other.rank ||
    this.file == other.file ||
    (this.rank - other.rank).abs() == (this.file - other.file).abs();
}
