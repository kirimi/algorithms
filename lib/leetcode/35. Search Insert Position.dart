/// 35. Search Insert Position
/// https://leetcode.com/problems/search-insert-position/
///
/// Given a sorted array of distinct integers and a target value,
/// return the index if the target is found. If not, return the index
/// where it would be if it were inserted in order.
//
// You must write an algorithm with O(log n) runtime complexity.

void main() {
  print(Solution().searchInsert([1, 3, 6, 8, 10, 12, 14], 13));
}

class Solution {
  int searchInsert(List<int> nums, int target) {
    if (target > nums.last) {
      return nums.length;
    }

    if (target < nums.first) {
      return 0;
    }

    int left = 0;
    int right = nums.length - 1;

    while (left < right) {
      int mid = (left + right) ~/ 2;

      if (nums[mid] == target) {
        return mid;
      }

      if (nums[mid] > target) {
        right = mid;
      } else {
        left = mid + 1;
      }
    }

    return left;
  }
}
