class Etl {
  Map<String, int> transform(Map<String, List<String>> original) {
    var result = <String, int>{};
    original.forEach((scoreString, letters) {
      var score = int.parse(scoreString);
      letters.forEach((letter) => result[letter.toLowerCase()] = score);
    });
    return result;
  }
}
