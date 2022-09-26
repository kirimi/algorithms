/// 88. Merge Sorted Array
///

void main() {
  final nums1 = [1, 2, 3, 0, 0, 0];
  final nums2 = [2, 5, 6];
  Solution().merge(nums1, 3, nums2, 3);
  print('Res: $nums1');
}

// todo не проходит тести с отрицательными числами
class Solution {
  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    for (var i = m; i < m + n; i++) {
      nums1[i] = nums2[i - m];
    }

    int index1 = 0;
    int index2 = m;

    while (index1 < index2) {
      print('${nums1}');
      print('${nums1[index1]} ${nums1[index2]}');
      if (nums1[index1] <= nums1[index2]) {
        index1++;
        continue;
      }

      final tmp = nums1[index2];
      nums1[index2] = nums1[index1];
      nums1[index1] = tmp;

      if (nums1[index2] > nums1[index2 + 1]) {
        index2++;
      } else {
        index1++;
      }
    }
  }
}
