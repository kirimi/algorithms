/// Задача из YaTalks 2021 https://youtu.be/_h0odGwUjkw?t=16281
/// Дан список
/// [[77, 0], [300, 1], [123, 2], [77, 0], [300, 1], [77, 0], [100, 2], [300, 1], [100, 2], [55, 1]]
/// отсортировать его по убыванию второго элемента подсписка
/// [[123, 2], [100, 2], [100, 2], [300, 1], [300, 1], [300, 1], [55, 1], [77, 0], [77, 0], [77, 0]]
///

void main() {
  final items = [
    [77, 0],
    [300, 1],
    [123, 2],
    [77, 0],
    [300, 1],
    [77, 0],
    [100, 2],
    [300, 1],
    [100, 2],
    [55, 1]
  ];

  print(items);

  inPlaceSort(items);

  print(items);
}

void inPlaceSort(List list) {
  void swap(int i1, int i2) {
    final tmp = list[i2];
    list[i2] = list[i1];
    list[i1] = tmp;
  }

  int l = 0, i = 0;
  int r = list.length - 1;
  while (i <= r) {
    if (list[i][1] == 2) {
      swap(i, l);
      l++;
      i++;
    } else if (list[i][1] == 0) {
      swap(i, r);
      r--;
    } else if (list[i][1] == 1) {
      i++;
    }
  }
}
