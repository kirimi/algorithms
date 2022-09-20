import 'dart:math';

/// Дан список интов,
/// найти максимальную длинну подсписка с неповторяющимися элементами

void main() {
  const case1 = '1112345553223470974760138746928350896720348546983841234567890';
  final List<int> case1List = case1.split('').map((e) => int.parse(e)).toList()
    ..addAll([11, 12, 13, 14, 15]);

  print('Case1: ${findUniqueSubList(case1List)}');

  const case2 = '12322671';
  final List<int> case2List = case2.split('').map((e) => int.parse(e)).toList();

  print('Case2: ${findUniqueSubList(case2List)}');

  final List<int> case3List = List.generate(
    500000,
    (_) => Random().nextInt(1000),
  );

  final benchmarkTimer = Stopwatch();
  benchmarkTimer.start();
  final result = findUniqueSubList(case3List);
  benchmarkTimer.stop();

  print('Case3: $result in ${benchmarkTimer.elapsedMilliseconds}ms');
}

int findUniqueSubList(List<int> list) {
  if (list.isEmpty) return 0;
  if (list.length == 1) return 1;
  if (list.length == 2) return list[0] != list[1] ? 2 : 1;

  int maxLength = 0;

  int start = 0;
  int end = 1;

  while (start <= list.length && end <= list.length) {
    // Если подстрока состоит из уникальных символов
    if (isUnique(list, start, end)) {
      maxLength = max(end - start, maxLength);
      end++;
      continue;
    }

    start++;
    end++;
  }

  return maxLength;
}

bool isUnique(List<int> list, int start, int end) {
  final subList = list.sublist(start, end);
  return subList.length == subList.toSet().length;
}
