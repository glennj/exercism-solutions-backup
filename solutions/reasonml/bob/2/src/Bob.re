let hey = (input) => {
  let cleaned = String.trim(input)

  /*
  let asking = String.ends_with(cleaned, ~suffix="?")
  */
  let asking = (s) => Char.equal('?', String.get(s, String.length(s) - 1))

  /*
  let isUpper = (c: char): bool => { let cc = Char.code(c); 65 <= cc && cc <= 90 }
  let isLower = (c: char): bool => { let cc = Char.code(c); 97 <= cc && cc <= 122 }
  let hasUpper = (s: string): bool => String.exists(isUpper, s)
  let hasLower = (s: string): bool => String.exists(isLower, s)
  let yelling = hasUpper(cleaned) && !hasLower(cleaned)
  */
  let upper = Js.Re.fromString("[A-Z]")
  let lower = Js.Re.fromString("[a-z]")
  let yelling = (s) => upper->Js.Re.test_(s) && !lower->Js.Re.test_(s)

  // test for silence: `asking` will throw an exception for 
  // an invalid index on an empty string.

  switch([asking(cleaned), yelling(cleaned)]) {
  | exception Invalid_argument("index out of bounds")
                 => "Fine. Be that way!"
  | [true, true] => "Calm down, I know what I'm doing!"
  | [true,    _] => "Sure."
  | [   _, true] => "Whoa, chill out!"
  | [   _,    _] => "Whatever."
  }
}
