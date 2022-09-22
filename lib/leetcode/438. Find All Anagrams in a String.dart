/// 438. Find All Anagrams in a String
/// https://leetcode.com/problems/find-all-anagrams-in-a-string/
///
/// Given two strings s and p, return an array of all the start indices of p's
/// anagrams in s. You may return the answer in any order.
///
/// An Anagram is a word or phrase formed by rearranging the letters
/// of a different word or phrase, typically using all the original
/// letters exactly once.

void main() {
  print('result: ${Solution().findAnagrams('abab', 'ab')}');
  print('result: ${Solution().findAnagrams('cbaebabacd', 'abc')}');
}

class Solution {
  List<int> findAnagrams(String s, String p) {
    final List<int> result = [];

    final codes = 'az'.codeUnits;

    final templLength = codes.last - codes.first + 1;
    final templ = List<int>.filled(templLength, 0);
    for (var i = 0; i < p.length; i++) {
      templ[p.codeUnitAt(i) - codes.first]++;
    }

    outerLoop:
    for (var i = 0; i < s.length - p.length + 1; i++) {
      final cand = templ.toList(growable: false);

      for (var j = i; j < i + p.length; j++) {
        if (--cand[s.codeUnitAt(j) - codes.first] < 0) {
          continue outerLoop;
        }
      }
      result.add(i);
    }
    return result;
  }
}
