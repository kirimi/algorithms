/// 153. Find Minimum in Rotated Sorted Array
/// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
///
/// Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,2,4,5,6,7] might become:
///
/// [4,5,6,7,0,1,2] if it was rotated 4 times.
/// [0,1,2,4,5,6,7] if it was rotated 7 times.
/// Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].
///
/// Given the sorted rotated array nums of unique elements, return the minimum element of this array.
///
/// You must write an algorithm that runs in O(log n) time.

void main() {
  final list = List<int>.generate(1000, (index) => index);

  final solver = Solution();

  for (int i = 0; i < list.length - 1; i++) {
    final shiftedList = list.sublist(i)..addAll(list.sublist(0, i));
    final result = solver.findMin(shiftedList);
    print('Min in list: $result');
  }
}

class Solution {
  int findMin(List<int> nums) {
    int start = 0;
    int end = nums.length - 1;

    int minValue = nums[0];

    while (start <= end) {
      final mid = (start + end) ~/ 2;

      if (nums[start] <= nums[mid]) {
        if (nums[start] < minValue) {
          minValue = nums[start];
        }
        start = mid + 1;
      } else {
        if (nums[mid] < minValue) {
          minValue = nums[mid];
        }
        end = mid - 1;
      }
    }
    return minValue;
  }
}
