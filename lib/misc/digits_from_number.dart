void main() {
  final number = 124534567;
  print(number);
  print(getDigitsFromNumber(number));
  print('Compre 1234 - 4321: ${compare(1234, 4321)}');
  print('Compre 9999 - 4321: ${compare(9999, 4321)}');
}

Iterable<int> getDigitsFromNumber(int number) {
  final List<int> result = [];
  int reminder = number;
  while (reminder > 0) {
    final digit = reminder % 10;
    result.add(digit);
    reminder = reminder ~/ 10;
  }
  return result.reversed;
}

/// Дано 2 числа.
/// Небходимо проверить можно ли из второго получить первое перестановкой цифр
bool compare(int a, int b) {
  final aDigits = getDigitsFromNumber(a).toList();
  final bDigits = getDigitsFromNumber(b).toList();

  if (aDigits.length != bDigits.length) {
    return false;
  }

  final List<int> counter = List.generate(10, (index) => 0);

  for (int i = 0; i < aDigits.length; i++) {
    counter[aDigits[i]]++;
    counter[bDigits[i]]--;
  }

  return counter.every((element) => element == 0);
}
