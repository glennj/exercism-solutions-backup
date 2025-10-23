class Timestamp {
  static fromSeconds(t) {
    return "%(pad_((t / 60 / 60).floor)):%(pad_((t / 60 % 60).floor)):%(pad_(t % 60))"
  }

  static pad_(n) { ("0" + n.toString)[-2..-1] }

  static toSeconds(s) {
    return s.split(":").reduce(0) {|acc, num| acc * 60 + Num.fromString(num)}
  }
}

