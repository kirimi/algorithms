/// 49. Group Anagrams
/// https://leetcode.com/problems/group-anagrams/
/// Given an array of strings strs, group the anagrams together.
/// You can return the answer in any order.
///
/// An Anagram is a word or phrase formed by rearranging the letters of a different
/// word or phrase, typically using all the original letters exactly once.
///
/// Input: strs = ["eat","tea","tan","ate","nat","bat"]
/// Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
///

void main() {
  final list = ["eat", "tea", "tan", "ate", "nat", "bat"];
  final grouped = Solution().groupAnagrams(list);
  print(list);
  print(grouped);
}

class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    final Map<String, List<String>> groups = {};

    for (final word in strs) {
      final key = _getKey(word);
      if (groups.containsKey(key)) {
        groups[key]!.add(word);
      } else {
        groups[key] = [word];
      }
    }

    final List<List<String>> result = [];
    groups.forEach((key, value) => result.add(value));

    return result;
  }

  String _getKey(String word) {
    final sorted = word.split('')..sort();
    return sorted.join();
  }
}
