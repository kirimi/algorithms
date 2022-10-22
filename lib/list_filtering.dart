/// Задача с YaTalks 2021 https://youtu.be/_h0odGwUjkw?t=16499
///
/// Дан список [1, 5, 5, 7, 8, 8, 10, 11, 20] и список что отфильтровать [5, 10]
/// Вернуть [1, 7, 8, 8, 11, 20]

void main() {
  final l = [1, 5, 5, 7, 8, 8, 10, 11, 20];
  final b = [5, 10];

  print('Filtered list: ${filterList(l, b)}');
}

List<int> filterList(List<int> list, List<int> exclude) {
  final List<int> result = [];

  final excludeSet = exclude.toSet();

  for (final item in list) {
    if (!excludeSet.contains(item)) {
      result.add(item);
    }
  }

  return result;
}
