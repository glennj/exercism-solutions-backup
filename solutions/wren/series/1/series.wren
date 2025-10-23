class Series {
  construct new(digits) {
    if (digits.isEmpty) Fiber.abort("series cannot be empty")

    _str = digits
    _len = digits.count
  }

  slices(n) {
    if (n > _len) Fiber.abort("slice length cannot be greater than series length")
    if (n == 0) Fiber.abort("slice length cannot be zero")
    if (n < 0) Fiber.abort("slice length cannot be negative")

    return (0.._len - n).map { |i| _str.skip(i).take(n).join() }.toList
  }
}
