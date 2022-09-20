import 'package:algorithms/dart_structures_and_algorithms/stack/stack.dart';

void main() {
  printReversed([1, 2, 3, 4, 5, 6, 7, 8, 9]);
  print(isStringBalancedParentheses('{h(([e]))<llo(world)>()}'));
  print(isStringBalancedParentheses('{h(([e]))<llo(world)>()'));
}

/// Create a function that prints the contents of a list in reverse order.
void printReversed<E>(List<E> list) {
  final stack = Stack<E>();
  for (E e in list) {
    stack.push(e);
  }

  while (stack.isNotEmpty) {
    print(stack.pop());
  }
}

///Check for balanced parentheses. Given a string, check if there are ({[< and >]}) characters,
/// and return true if the parentheses in the string are balanced. For example:
/// h((e))llo(world)() // balanced parentheses
/// (hello world // unbalanced parentheses

final open = <int>[
  '('.codeUnitAt(0),
  '{'.codeUnitAt(0),
  '['.codeUnitAt(0),
  '<'.codeUnitAt(0)
];
final close = <int>[
  ')'.codeUnitAt(0),
  '}'.codeUnitAt(0),
  ']'.codeUnitAt(0),
  '>'.codeUnitAt(0)
];

bool isStringBalancedParentheses(String string) {
  final stack = Stack<int>();

  for (final e in string.codeUnits) {
    if (open.contains(e)) {
      stack.push(e);
    } else if (close.contains(e)) {
      if (stack.isEmpty) {
        return false;
      }

      final openElement = open[close.indexOf(e)];
      if (stack.peek != openElement) {
        return false;
      }

      stack.pop();
    }
  }
  return stack.isEmpty;
}
