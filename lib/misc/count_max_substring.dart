import 'dart:math';

/// Задачка с собеса
/// Найти максимальную последовательность единиц, если удалить один элемент

void main() {
  final str = '1011001111101';
  print(counter(str));
}

int counter(String str) {
  int maxSum = 0, prev = 0, curr = 0;

  for (var i = 0; i < str.length; i++) {
    if (str[i] == '1') {
      curr++;
    } else {
      maxSum = max(maxSum, prev + curr);
      prev = curr;
      curr = 0;
    }
  }

  maxSum = max(maxSum, prev + curr);

  return maxSum;
}
