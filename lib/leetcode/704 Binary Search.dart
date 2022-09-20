void main() {
  final list = List<int>.generate(20, (index) => index);
  final solver = Solution();
  print('Index of 10 is: ${solver.search(list, 10)}');
  print('Index of 100 is: ${solver.search(list, 100)}');
}

/// 704. Binary Search
/// https://leetcode.com/problems/binary-search/
///
/// Given an array of integers nums which is sorted in ascending order,
/// and an integer target, write a function to search target in nums.
/// If target exists, then return its index. Otherwise, return -1.

class Solution {
  int search(List<int> nums, int target) {
    if (nums.isEmpty) {
      return -1;
    }
    if (nums.length == 1) {
      return nums[0] == target ? 0 : -1;
    }

    int start = 0;
    int end = nums.length - 1;

    while (start <= end) {
      int index = (start + end) ~/ 2;

      if (nums[index] == target) {
        return index;
      }

      if (nums[index] > target) {
        end = index - 1;
      } else {
        start = index + 1;
      }
    }
    return -1;
  }
}
