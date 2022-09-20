/// Бинарный поиск
void main(List<String> arguments) {
  final List<int> sortedList = [1, 3, 5, 6, 7, 8, 9, 14, 34, 37];
  final result = binarySearch(sortedList, 14);
  assert(sortedList.indexOf(14) == result);
  final result2 = binarySearch(sortedList, 100);
  assert(-1 == result2);
}

/// Бинарный поиск
/// Поиск в отсортированном массиве
/// O(log n)
int binarySearch(List<int> sortedList, int searchTerm) {
  int left = 0;
  int right = sortedList.length - 1;

  while (left <= right) {
    final int index = (left + right) ~/ 2;
    final candidate = sortedList[index];
    if (candidate == searchTerm) {
      return index;
    }
    if (candidate > searchTerm) {
      right = index - 1;
    } else {
      left = index + 1;
    }
  }
  return -1;
}
