/// 242. Valid Anagram
/// https://leetcode.com/problems/valid-anagram/
///
/// Given two strings s and t, return true if t is an anagram of s, and false otherwise.
///
/// An Anagram is a word or phrase formed by rearranging the letters of
/// a different word or phrase, typically using all the original letters exactly once.

void main() {
  final ok = Solution().isAnagram('anagram', 'nagaram');
  print(ok);
  final notOk = Solution().isAnagram('onagram', 'nagaram');
  print(notOk);
}

class Solution {
  bool isAnagram(String s, String t) {
    if (s.length != t.length) {
      return false;
    }

    final aCode = 'a'.codeUnitAt(0);
    final zCode = 'z'.codeUnitAt(0);
    final counterLength = zCode - aCode + 1;

    final counter = List<int>.generate(counterLength, (index) => 0);

    for (var i = 0; i < s.length; i++) {
      final index1 = s.codeUnitAt(i) - aCode;
      counter[index1]++;

      final index2 = t.codeUnitAt(i) - aCode;
      counter[index2]--;
    }

    return counter.every((e) => e == 0);
  }
}
