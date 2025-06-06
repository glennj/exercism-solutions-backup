class Forth {
  List<int> stack = [];
  Map<String, List<String>> words = {};

  List<int> evaluate(String program) {
    for (var line in program.split('\n')) {
      _evaluateLine(line.toUpperCase());
    }
    return this.stack;
  }

  void _evaluateLine(line) {
    var tokens = line.split(' ');
    while (tokens.isNotEmpty) {
      var token = tokens.removeAt(0);
      var number = int.tryParse(token);
      if (number != null) {
        this.stack.add(number);
      } else if (token == ':') {
        _defineWord(tokens);
        tokens = [];
      } else if (this.words.containsKey(token)) {
        tokens = (this.words[token] ?? []) + tokens;
      } else if (['+', '-', '*', '/'].contains(token)) {
        _arithmeticOperation(token);
      } else if (token == 'DUP') {
        _dup();
      } else if (token == 'DROP') {
        _drop();
      } else if (token == 'SWAP') {
        _swap();
      } else if (token == 'OVER') {
        _over();
      } else {
        throw Exception('Unknown command');
      }
    }
  }

  void _defineWord(List<String> tokens) {
    var word = tokens.removeAt(0);
    var number = int.tryParse(word);
    if (number != null) throw Exception('Invalid definition');

    tokens.removeLast(); // the trailing semicolon
    this.words[word] = tokens.fold([], (defn, token) {
      return defn + (this.words[token] ?? [token]);
    });
  }

  void _needs(int n) {
    if (this.stack.length < n) {
      throw Exception('Stack empty');
    }
  }

  void _arithmeticOperation(String operation) {
    _needs(2);
    var b = this.stack.removeLast();
    var a = this.stack.removeLast();
    switch (operation) {
      case '+':
        this.stack.add(a + b);
        break;
      case '-':
        this.stack.add(a - b);
        break;
      case '*':
        this.stack.add(a * b);
        break;
      default:
        if (b == 0) throw Exception('Division by zero');
        this.stack.add(a ~/ b);
    }
    ;
  }

  void _dup() {
    _needs(1);
    var a = this.stack.last;
    this.stack.add(a);
  }

  void _drop() {
    _needs(1);
    this.stack.removeLast();
  }

  void _swap() {
    _needs(2);
    var b = this.stack.removeLast();
    var a = this.stack.removeLast();
    this.stack.add(b);
    this.stack.add(a);
  }

  void _over() {
    _needs(2);
    var b = this.stack.removeLast();
    var a = this.stack.last;
    this.stack.add(b);
    this.stack.add(a);
  }
}
