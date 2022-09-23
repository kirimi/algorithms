import 'dart:math';

/// 763. Partition Labels
/// https://leetcode.com/problems/partition-labels/
///
/// You are given a string s. We want to partition the string into as many
/// parts as possible so that each letter appears in at most one part.
///
/// Note that the partition is done so that after concatenating all the parts
/// in order, the resultant string should be s.
///
/// Return a list of integers representing the size of these parts.

void main() {
  final s = "ababcbacadefegdehijhklij";
  print(Solution().partitionLabels(s));
}

class Solution {
  List<int> partitionLabels(String s) {
    final Map<String, int> last = {};
    for (var i = 0; i < s.length; i++) {
      last.update(s[i], (l) => i, ifAbsent: () => i);
    }

    final List<int> result = [];

    int l = 0;
    int r = 0;
    while (l < s.length) {
      r = last[s[l]]!;
      for (var i = l; i < r; i++) {
        r = max(r, last[s[i]]!);
      }
      result.add(r - l + 1);
      l = r + 1;
    }

    return result;
  }
}
