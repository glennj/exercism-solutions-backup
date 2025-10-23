class Series {
  construct new(digits) {
    if (digits.isEmpty) Fiber.abort("series cannot be empty")

    _str = digits
    _len = digits.count
  }

  slices(size) {
    if (size > _len) Fiber.abort("slice length cannot be greater than series length")
    if (size == 0) Fiber.abort("slice length cannot be zero")
    if (size < 0) Fiber.abort("slice length cannot be negative")

    return (0.._len - size).map { |i| _str.skip(i).take(size).join() }.toList
  }
}
