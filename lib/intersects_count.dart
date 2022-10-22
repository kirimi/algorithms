/// Задчака с YaTalks 2021 https://youtu.be/_h0odGwUjkw?t=17423
/// Найти максимум пересечений

void main() {
  final list = [
    [10, 20],
    [20, 30],
    [2, 40]
  ];

  print('Intersects count: ${intersectsCount(list)}');
}

int intersectsCount(List list) {
  final days = {};
  for (final item in list) {
    for (int i = item[0]; i <= item[1]; i++) {
      days.update(i, (value) => value + 1, ifAbsent: () => 1);
    }
  }
  final maxCount =
      days.values.fold(0, (prev, curr) => curr > prev ? curr : prev);
  return maxCount;
}
