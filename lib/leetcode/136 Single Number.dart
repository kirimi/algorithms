/// 136. Single Number
/// https://leetcode.com/problems/single-number/  решить за O(1) по памяти
///
/// Given a non-empty array of integers nums, every element appears twice
/// except for one. Find that single one.
///
/// You must implement a solution with a linear runtime complexity and use only
/// constant extra space.
///

void main() {
  final list = [-1, 4, 1, -1, 2, 5, 1, 5, 2];

  final solver = Solution();
  final res = solver.singleNumber(list);
  print('Unique value in $list is $res');
}

class Solution {
  int singleNumber(List<int> nums) {
    int res = 0;
    for (final n in nums) {
      res = res ^ n;
    }
    return res;
  }
}
