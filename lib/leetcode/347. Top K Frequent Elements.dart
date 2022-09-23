/// 347. Top K Frequent Elements
/// https://leetcode.com/problems/top-k-frequent-elements/
///
/// Given an integer array nums and an integer k, return the k most frequent elements.
/// You may return the answer in any order.
///

void main() {
  final nums = [2, 2, 2, 1, 1, 1, 3];
  print('Answer: ${Solution().topKFrequent(nums, 2)}');
}

class Solution {
  List<int> topKFrequent(List<int> nums, int k) {
    final Map<int, int> hashMap = {};

    for (final num in nums) {
      if (hashMap[num] == null) {
        hashMap[num] = 1;
      } else {
        hashMap[num] = hashMap[num]! + 1;
      }
    }

    final res = hashMap.entries.toList()
      ..sort((a, b) {
        // Если частота одинаковая, то сортируем по значению
        if (b.value.compareTo(a.value) == 0) {
          return a.key.compareTo(b.key);
        }
        return b.value.compareTo(a.value);
      });

    return res.sublist(0, k).map((e) => e.key).toList();
  }
}

// List<int> topKFrequentElements(List<int> numbers, {int k = 3}) {
//   final Map<int, int> map = {};
//   for (final number in numbers) {
//     if (map.containsKey(number))
//       map[number] += 1;
//     else
//       map[number] = 1;
//   }
//   final Comparator<int> comparison = (e1, e2) => map[e1].compareTo(map[e2]);
//   final heap = HeapPriorityQueue<int>(comparison);
//   for (final key in map.keys) {
//     heap.add(key);
//     if (heap.length > k) heap.removeFirst();
//   }
//   final List<int> topkElements = heap.toList();
//   heap.removeAll();
//   return topkElements;
// }
