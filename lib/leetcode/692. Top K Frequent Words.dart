/// 692. Top K Frequent Words
/// https://leetcode.com/problems/top-k-frequent-words/
///
/// Given an array of strings words and an integer k,
/// return the k most frequent strings.
///
///  Return the answer sorted by the frequency from highest to lowest.
///  Sort the words with the same frequency by their lexicographical order.

void main() {
  final words = ["a", "aa", "aaa"];
  final words2 = ["i", "love", "leetcode", "i", "love", "coding"];
  final solver = Solution();

  print(solver.topKFrequent(words, 1));
  print(solver.topKFrequent(words2, 3));
}

class Solution {
  List<String> topKFrequent(List<String> words, int k) {
    final Map<int, Set<String>> freqMap = {};
    final Map<String, int> wordMap = {};

    for (final word in words) {
      if (wordMap.containsKey(word)) {
        final oldCount = wordMap[word]!;
        wordMap[word] = oldCount + 1;
        freqMap[oldCount]?.remove(word);
        freqMap[oldCount + 1] ??= {};
        freqMap[oldCount + 1]?.add(word);
      } else {
        wordMap[word] = 1;
        freqMap[1] ??= {};
        freqMap[1]?.add(word);
      }
    }

    final List<String> res = [];

    final sortedKeys = freqMap.keys.toList()..sort((a, b) => b.compareTo(a));

    for (final key in sortedKeys) {
      final r = freqMap[key]!.toList();
      r.sort();
      res.addAll(r);
      if (res.length >= k) {
        break;
      }
    }

    return res.sublist(0, k);
  }
}
