import 'list_node.dart';

/// 23. Merge k Sorted Lists
/// You are given an array of k linked-lists lists, each linked-list is sorted
/// in ascending order.
///
/// Merge all the linked-lists into one sorted linked-list and return it.

void main() {
  final list1 = ListNode(1, ListNode(2, ListNode(3, null)));
  final list2 = ListNode(1, ListNode(2, ListNode(3, null)));

  final solver = Solution();
  print(solver.mergeKLists([list1, list2]));
  print(solver.mergeKLists([]));
}

class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {
    ListNode? root = ListNode();

    ListNode? curr = root;
    while (true) {
      // Ищем индекс списка, в голове которого лежит минимальное значение
      int? minVal;
      int? index;
      for (int i = 0; i < lists.length; i++) {
        final value = lists[i]?.val;
        if (value != null) {
          minVal ??= value;
          if (value <= minVal) {
            minVal = value;
            index = i;
          }
        }
      }

      // Нет больше элементов
      if (index == null) {
        break;
      }

      // Вставляем в новый список
      curr?.next = lists[index];
      curr = curr?.next;

      // Удаляем из старого списка
      lists[index] = lists[index]?.next;
    }
    return root.next;
  }
}
