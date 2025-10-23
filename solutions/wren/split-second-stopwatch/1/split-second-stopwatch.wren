class Timestamp {
  static fromSeconds(t) {
    var s = t % 60
    var m = (t / 60 % 60).floor
    var h = (t / 60 / 60).floor
    return "%(pad_(h)):%(pad_(m)):%(pad_(s))"
  }

  static toSeconds(s) {
    return s.split(":").reduce(0) {|acc, num| acc * 60 + Num.fromString(num)}
  }

  static pad_(n) { n < 10 ? "0%(n)" : n.toString }
}

class Stopwatch {
  construct new() {
    reset_()
  }

  reset_() {
    _laps = []
    _lapTime = 0
    _total = 0
    _state = "ready"
  }

  state() { _state }

  currentLap() { Timestamp.fromSeconds(_lapTime) }

  previousLaps() { _laps }

  total() { Timestamp.fromSeconds(_lapTime + _total) }

  start() {
    if (_state == "running") Fiber.abort("cannot start an already running stopwatch")
    _state = "running"
  }

  stop() {
    if (_state != "running") Fiber.abort("cannot stop a stopwatch that is not running")
    _state = "stopped"
  }

  reset() {
    if (_state != "stopped") Fiber.abort("cannot reset a stopwatch that is not stopped")
    reset_()
  }

  advanceTime(by) {
    if (_state != "running") return
    _lapTime = _lapTime + Timestamp.toSeconds(by)
  }

  lap() {
    if (_state != "running") Fiber.abort("cannot lap a stopwatch that is not running")
    _laps.add(currentLap())
    _total = _total + _lapTime
    _lapTime = 0
  }
}
