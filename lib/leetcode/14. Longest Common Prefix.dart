import 'dart:math';

/// 14. Longest Common Prefix
/// https://leetcode.com/problems/longest-common-prefix/
///
/// Write a function to find the longest common prefix string amongst an array
/// of strings.
///
/// If there is no common prefix, return an empty string "".

void main() {
  final strs = ["flower", "flow", "flight"];
  print('Solution: ${Solution().longestCommonPrefix(strs)}');
}

class Solution {
  String longestCommonPrefix(List<String> strs) {
    if (strs.length == 1) {
      return strs[0];
    }

    int commonLength = strs[0].length;
    List<int> template = strs[0].codeUnits;

    for (var i = 1; i < strs.length; i++) {
      commonLength = min(commonLength, strs[i].length);
      for (var j = 0; j < commonLength; j++) {
        if (strs[i].codeUnitAt(j) != template[j]) {
          commonLength = j;
          break;
        }
      }
    }

    return strs[0].substring(0, commonLength);
  }
}
