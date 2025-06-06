class Etl {
  Map<String, int> transform(Map<String, List<String>> original) =>
    Map.fromEntries(
      original.entries
        .map((entry) => MapEntry(int.parse(entry.key), entry.value))
        .expand((entry) => entry.value.expand((letter) => [MapEntry(letter.toLowerCase(), entry.key)]))
    );
}
