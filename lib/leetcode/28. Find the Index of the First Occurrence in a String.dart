/// 28. Find the Index of the First Occurrence in a String
/// https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/
///
/// Given two strings needle and haystack, return the index of the first
/// occurrence of needle in haystack, or -1 if needle is not part of haystack.

void main() {
  print(Solution().strStr('sadbutsad', 'but'));
}

class Solution {
  int strStr(String haystack, String needle) {
    int needleIndex = 0;
    int nextIndex = -1;

    for (var i = 0; i < haystack.length; i++) {
      if (haystack[i] == needle[needleIndex]) {
        if (nextIndex == -1) {
          nextIndex = i;
        }

        needleIndex++;
        if (needleIndex >= needle.length) {
          return i - needleIndex + 1;
        }
      } else {
        if (nextIndex != -1) {
          i = nextIndex;
        }
        nextIndex = -1;
        needleIndex = 0;
      }
    }

    return -1;
  }
}
