/// 78. Subsets
/// https://leetcode.com/problems/subsets/
///
/// Given an integer array nums of unique elements,
/// return all possible subsets (the power set).
///
/// The solution set must not contain duplicate subsets.
/// Return the solution in any order.

void main() {
  final nums = [1, 2, 3];
  print(Solution().subsets(nums));
}

class Solution {
  /// Cascading
  List<List<int>> subsets(List<int> nums) {
    final List<List<int>> res = [[]];

    for (final num in nums) {
      final List<List<int>> sub = [];
      for (final curr in res) {
        final l = curr.toList();
        l.add(num);
        sub.add(l);
      }
      res.addAll(sub);
    }

    return res;
  }
}
