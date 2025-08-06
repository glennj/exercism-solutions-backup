let rec intPow = (num, exp) => {
  switch (exp) {
  | 0 => 1
  | _ => num * intPow(num, exp - 1)
  };
};

let floor = Js.Math.floor;
let log = Js.Math.log;
let toFloat = Belt.Int.toFloat;

/* Using the Binary numeral system (base 2) from Wikipedia
 * https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Binary_numeral_system_%28base_2%29
 */

let squareRoot = radicand => {
  let rec sqrt = (n, x, b) => {
    switch (b) {
    | 0 => x
    | _ =>
      if (n >= x + b) {
        sqrt(n - x - b, x / 2 + b, b / 4);
      } else {
        sqrt(n, x / 2, b / 4);
      }
    };
  };

  // greatest power of 4 less than the radicand
  let b = intPow(4, floor(log(toFloat(radicand)) /. log(4.0)));

  sqrt(radicand, 0, b);
};
