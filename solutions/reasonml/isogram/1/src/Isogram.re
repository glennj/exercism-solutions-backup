let is_isogram = phrase => {
  let rec do_isogram = (str, seen) => {
    if (String.length(str) == 0) {
      true
    } else {
      let char = Char.code(str.[0]);
      let rest = String.sub(str, 1, String.length(str) - 1)

      if (char < 65 || char > 97) {
        do_isogram(rest, seen)
      } else if (!Belt.Set.Int.has(seen, char)) {
        do_isogram(rest, Belt.Set.Int.add(seen, char))
      } else {
        false
      }
    }
  }

  do_isogram(String.uppercase_ascii(phrase), Belt.Set.Int.empty)
};
