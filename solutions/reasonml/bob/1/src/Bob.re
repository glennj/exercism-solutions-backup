let hey = (input) => {
  let cleaned = String.trim(input)

  if (String.length(cleaned) == 0) {
    "Fine. Be that way!"
  } else {
    /*
    let asking = String.ends_with("?", cleaned)
    */
    let asking = Char.equal('?', String.get(cleaned, String.length(cleaned) - 1))

    /*
    let isUpper = (c: char): bool => { let cc = Char.code(c); 65 <= cc && cc <= 90 }
    let isLower = (c: char): bool => { let cc = Char.code(c); 97 <= cc && cc <= 122 }
    let hasUpper = (s: string): bool => String.exists(isUpper, s)
    let hasLower = (s: string): bool => String.exists(isLower, s)
    let yelling = hasUpper(cleaned) && !hasLower(cleaned)
    */

    let upper = Js.Re.fromString("[A-Z]")
    let lower = Js.Re.fromString("[a-z]")
    let yelling = upper->Js.Re.test_(cleaned) && !lower->Js.Re.test_(cleaned)

    switch([asking, yelling]) {
    | [ true,  true] => "Calm down, I know what I'm doing!"
    | [ true, false] => "Sure."
    | [false,  true] => "Whoa, chill out!"
    | _ => "Whatever."
    }
  }
}
