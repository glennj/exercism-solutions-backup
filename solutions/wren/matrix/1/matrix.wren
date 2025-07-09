class Matrix {
  static row(string, index) { string2matrix(string)[index - 1] }
  
  static column(string, index) { string2matrix(string).map {|row| row[index - 1]}.toList }

  static string2matrix(string) {
    return string
      .split("\n")
      .map {|row| row.split(" ").map {|n| Num.fromString(n)}.toList}
      .toList
  }
}
