import 'dart:math';

/// 11. Container With Most Water
/// https://leetcode.com/problems/container-with-most-water/
///
/// You are given an integer array height of length n. There are n vertical
/// lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
///
/// Find two lines that together with the x-axis form a container, such that
/// the container contains the most water.
///
/// Return the maximum amount of water a container can store.
///
/// Notice that you may not slant the container.

void main() {
  final heights = [2, 2, 2, 0, 0, 2];
  final area = Solution().maxArea(heights);
  print('area: $area');
}

class Solution {
  int maxArea(List<int> height) {
    int left = 0;
    int right = height.length - 1;

    int maxArea = 0;
    while (left != right) {
      int currentArea = (right - left) * min(height[left], height[right]);
      maxArea = max(maxArea, currentArea);
      if (height[left] > height[right]) {
        right--;
      } else {
        left++;
      }
    }

    return maxArea;
  }
}
