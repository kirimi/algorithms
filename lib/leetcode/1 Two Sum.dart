/// 1. Two Sum
/// https://leetcode.com/problems/two-sum/
///
/// Given an array of integers nums and an integer target, return indices
/// of the two numbers such that they add up to target.
///
/// You may assume that each input would have exactly one solution,
/// and you may not use the same element twice.
///
/// You can return the answer in any order.

void main() {
  final list = [3, 2, 4];
  final target = 6;

  final solver1 = Solution1();
  final solver2 = Solution2();

  print(solver1.twoSum(list, target));
  print(solver2.twoSum(list, target));
}

/// Solution O(N) Space O(N)
class Solution1 {
  List<int> twoSum(List<int> nums, int target) {
    final Map<int, int> sum = {};

    for (int i = 0; i < nums.length; i++) {
      sum[target - nums[i]] = i;
    }

    for (int i = 0; i < nums.length; i++) {
      if (sum.containsKey(nums[i]) && sum[nums[i]]! != i) {
        return [sum[nums[i]]!, i];
      }
    }

    return [-1];
  }
}

/// Solution O(N^2) Space O(1)
class Solution2 {
  List<int> twoSum(List<int> nums, int target) {
    for (int i = 0; i < nums.length - 1; i++) {
      final searchTerm = target - nums[i];
      final index = nums.lastIndexOf(searchTerm);

      if (index != -1 && index != i) {
        return [i, index];
      }
    }

    return [-1];
  }
}
