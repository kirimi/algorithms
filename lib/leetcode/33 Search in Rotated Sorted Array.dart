import 'dart:math';

/// 33. Search in Rotated Sorted Array
/// https://leetcode.com/problems/search-in-rotated-sorted-array/
///
/// There is an integer array nums sorted in ascending order (with distinct values).
///
///  Prior to being passed to your function, nums is possibly rotated at an unknown
///  pivot index k (1 <= k < nums.length) such that the resulting array is
///  [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed).
///  For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].
///
/// Given the array nums after the possible rotation and an integer target,
/// return the index of target if it is in nums, or -1 if it is not in nums.
///
/// You must write an algorithm with O(log n) runtime complexity.

void main() {
  final list = List<int>.generate(200, (index) => Random().nextInt(3))..sort();
  final shiftedList = list.sublist(50)..addAll(list.sublist(0, 50));

  final solver = Solution();
  for (final target in shiftedList) {
    final pos = solver.search(shiftedList, target);
    print('Target $target in array: position $pos');
  }
}

class Solution {
  int search(List<int> nums, int target) {
    if (nums.length == 1) {
      return nums[0] == target ? 0 : -1;
    }

    int start = 0;
    int end = nums.length - 1;

    while (start <= end) {
      int mid = (start + end) ~/ 2;

      if (nums[start] <= nums[mid]) {
        if (target.clamp(nums[start], nums[mid]) == target) {
          return _binarySearch(nums, start, mid, target);
        }
        start = mid + 1;
      } else {
        if (target.clamp(nums[mid], nums[end]) == target) {
          return _binarySearch(nums, mid, end, target);
        }
        end = mid - 1;
      }
    }

    return -1;
  }

  int _binarySearch(List<int> nums, int start, int end, int target) {
    while (start <= end) {
      final mid = (start + end) ~/ 2;
      if (nums[mid] == target) {
        return mid;
      }
      if (nums[mid] > target) {
        end = mid - 1;
      } else {
        start = mid + 1;
      }
    }
    return -1;
  }
}
