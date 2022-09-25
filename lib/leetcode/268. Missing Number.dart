/// 268. Missing Number
/// https://leetcode.com/problems/missing-number/
/// Given an array nums containing n distinct numbers in the range [0, n],
/// return the only number in the range that is missing from the array.

class Solution {
  int missingNumber(List<int> nums) {
    int minVal = nums.fold(nums[0], (m, v) => v < m ? v : m);
    int maxVal = nums.fold(nums[0], (m, v) => v > m ? v : m);

    final buff = List<bool>.filled(maxVal - minVal + 1, false);

    for (var i = 0; i < nums.length; i++) {
      buff[nums[i] - minVal] = true;
    }

    final idx = buff.indexOf(false);

    if (idx == -1) {
      if (minVal > 0) {
        return minVal - 1;
      } else {
        return maxVal + 1;
      }
    } else {
      return buff.indexOf(false) + minVal;
    }
  }
}
