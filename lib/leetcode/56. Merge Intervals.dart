/// 56. Merge Intervals
/// https://leetcode.com/problems/merge-intervals/
///
/// Given an array of intervals where intervals[i] = [starti, endi], merge all
/// overlapping intervals, and return an array of the non-overlapping intervals
/// that cover all the intervals in the input.

void main() {
  final intervals = [
    [1, 4],
    [2, 3],
    [5, 6],
    [7, 10],
    [9, 11]
  ];
  final merged = Solution().merge(intervals);
  print('Merged intervals are: $merged');
}

class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    if (intervals.length == 1) {
      return intervals;
    }

    intervals.sort((a, b) => a[0].compareTo(b[0]));

    final List<List<int>> result = [];

    result.add(intervals[0]);

    for (var i = 1; i < intervals.length; i++) {
      if (intervals[i][0] > result.last[1]) {
        result.add(intervals[i]);
      } else {
        if (result.last[1] < intervals[i][1]) {
          result.last[1] = intervals[i][1];
        }
      }
    }

    return result;
  }
}
