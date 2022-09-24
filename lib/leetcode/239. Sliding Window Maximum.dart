/// 239. Sliding Window Maximum
/// https://leetcode.com/problems/sliding-window-maximum/

void main() {
  print('res: ${Solution().maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3)}');
  print('res: ${Solution().maxSlidingWindow([1, 3, 2, 1], 1)}');
}

// todo Time Limit Exceeded
class Solution {
  List<int> maxSlidingWindow(List<int> nums, int k) {
    print(nums);

    final List<int> result = [];

    int maxIndex = 0;
    int maxValue = nums[0];

    void setMax(int from, int to) {
      maxIndex = from;
      maxValue = nums[from];
      for (var i = from; i < to; i++) {
        if (nums[i] >= maxValue) {
          maxValue = nums[i];
          maxIndex = i;
        }
      }
    }

    setMax(0, k);

    result.add(maxValue);

    for (var i = 1; i < nums.length - k + 1; i++) {
      if (nums[i + k - 1] >= maxValue && i < maxIndex) {
        maxIndex = i + k - 1;
        maxValue = nums[i + k - 1];
        result.add(maxValue);
        print('1 ${nums.sublist(i, i + k)} maxValue: $maxValue');
        continue;
      }

      if (i > maxIndex) {
        setMax(i, i + k);
        result.add(maxValue);
        print('2 ${nums.sublist(i, i + k)} maxValue: $maxValue');
        continue;
      }

      result.add(maxValue);
      print('3 ${nums.sublist(i, i + k)} maxValue: $maxValue');
    }

    return result;
  }
}
