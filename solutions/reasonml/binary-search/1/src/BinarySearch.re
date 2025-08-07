let find = (xs: array(int), x: int): option(int) => {
  let rec finder = (left, right) =>
    if (left > right)
      None
    else {
      let mid = (left + right) / 2
      let item = Array.get(xs, mid)

      if (item < x)
        finder(mid + 1, right)
      else if (item > x)
        finder(left, mid - 1)
      else
        Some(mid)
    };

  finder(0, Array.length(xs) - 1)
};
