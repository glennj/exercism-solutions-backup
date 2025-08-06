/* Builtin list functionality used:
 * - List.cons
 * - list constructor []
 * - list destructuring [head, ...rest]
 */

let foldl = (lst, init, accumulator) => {
  let rec helper = (xs, acc) => {
    switch (xs) {
    | [] => acc
    | [x, ...rest] => helper(rest, accumulator(acc, x))
    }
  };

  helper(lst, init);
};

let reverse = (xs) => foldl(xs, [], (acc, x) => List.cons(x, acc));

let append = (a, b) => {
  let rec helper = (source, target) => {
    switch (source) {
    | [] => target
    | [head, ...rest] => helper(rest, List.cons(head, target))
    };
  };

  helper(reverse(a), b);
};

// everything else is implemented with foldl

let length = (xs) => foldl(xs, 0, (n, _) => n + 1);

let concat = (listOfLists) => foldl(listOfLists, [], append);

let filter = (xs, pred) => {
  foldl(xs, [], (acc, x) => pred(x) ? List.cons(x, acc) : acc) -> reverse;
};

let map = (xs, func) => {
  foldl(xs, [], (acc, x) => List.cons(func(x), acc)) -> reverse;
};

let foldr = (xs, init, accumulator) => foldl(reverse(xs), init, accumulator);
