import 'dart:convert';
import 'forth_stack.dart';
import 'forth_words.dart';

class Forth {
  ForthStack _stack = ForthStack();
  ForthWords _words = ForthWords();

  List<int> get stack => _stack.toList();

  /* TODO make the word definitions more sophisticated.
   * This code assumes that `:` starts a line and `;` ends it.
   * We should start capturing words when we see a `:`, and
   * then define the word when we see a `;`, even if they're on
   * different lines.
   */
  void evaluate(String program) {
    LineSplitter
        .split(program)
        .map((line) => line.toUpperCase().split(' '))
        .forEach(_eval);
  }

  void _eval(List<String> tokens) {
    while (tokens.isNotEmpty) {
      var token = tokens.removeAt(0);
      var number = int.tryParse(token);
      if (number != null) _stack.push(number);
      else if (_words.hasDefinition(token)) tokens = _words.get(token) + tokens;
      else if (token == '+') _stack.add();
      else if (token == '-') _stack.subtract();
      else if (token == '*') _stack.multiply();
      else if (token == '/') _stack.divide();
      else if (token == 'DUP') _stack.dup();
      else if (token == 'DROP') _stack.drop();
      else if (token == 'SWAP') _stack.swap();
      else if (token == 'OVER') _stack.over();
      else if (token == ':') {
        _words.add(tokens);
        tokens = [];
      }
      else throw Exception('Unknown command');
    }
  }
}
