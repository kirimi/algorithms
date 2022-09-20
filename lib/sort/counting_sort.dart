import 'dart:math';

void main() {
  final list = List<int>.generate(10, (index) => Random().nextInt(20));

  print(list);

  countingSort(list);

  print(list);
}

/// Сортировка подсчетом
///
void countingSort(list) {
  final min = minOfList(list);
  final max = maxOfList(list);
  final countingListLength = max - min + 1;

  final countingList = List<int>.generate(countingListLength, (index) => 0);

  for (int i = 0; i < list.length; i++) {
    countingList[list[i] - min] += 1;
  }

  int listIndex = 0;
  for (int i = 0; i < countingListLength; i++) {
    for (int j = 0; j < countingList[i]; j++) {
      list[listIndex] = i + min;
      listIndex++;
    }
  }
}

int minOfList(List<int> list) {
  int min = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] < min) {
      min = list[i];
    }
  }
  return min;
}

int maxOfList(List<int> list) {
  int max = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] > max) {
      max = list[i];
    }
  }
  return max;
}
