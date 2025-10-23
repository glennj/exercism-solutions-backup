class Timestamp {
  static fromSeconds(t) {
    var h = (t / 60 / 60).floor
    var m = (t / 60 % 60).floor
    var s = t % 60
    return [h, m, s].map {|n| ("0" + n.toString)[-2..-1] }.join(":")
  }

  static toSeconds(s) {
    return s.split(":").reduce(0) {|acc, num| acc * 60 + Num.fromString(num)}
  }
}

