/// Задача. Дан массив целых чисел arr и целое число X.
/// Определите, существует ли в массиве такой непрерывный подмассив,
/// что сумма его элементов равна X.
/// Ограничения:
/// Элементы arr — неотрицательные
/// Элементы arr расположены в порядке неубывания
/// Элементы arr расположены в порядке неубывания и в то же время неотрицательны

void main() {
  final list = [1, 4, 8, 2, 10];
  final sum = 10;

  print('Result: ${containsSublistSum(list, sum)}');
}

/// Методом 2 указателя
bool containsSublistSum(List<int> list, int sum) {
  int currentSum = 0;

  int right = 0;
  int left = 0;

  // Тут можно было бы переменную цикла сделать left,
  // но для ясности вынес отдельно
  for (final _ in list) {
    if (left > 0) {
      currentSum -= list[left - 1];
    }

    while (right < list.length && currentSum < sum) {
      currentSum += list[right];
      right++;
    }

    if (currentSum == sum) {
      return true;
    }

    left++;
  }

  return false;
}
