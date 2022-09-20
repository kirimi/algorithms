/// 74. Search a 2D Matrix
/// https://leetcode.com/problems/search-a-2d-matrix/
///
/// Write an efficient algorithm that searches for a value target in an m x n
/// integer matrix matrix. This matrix has the following properties:
///
/// Integers in each row are sorted from left to right.
/// The first integer of each row is greater than the last integer of the previous row.
///
///

void main() {
  final matrix = [
    [1, 2, 3, 4, 5, 6, 7, 8],
    [11, 12, 13, 14, 15, 16, 17, 18],
  ];

  final solver = Solution();
  print('Target 14: ${solver.searchMatrix(matrix, 14)}');
  print('Target 5: ${solver.searchMatrix(matrix, 5)}');
  print('Target 1: ${solver.searchMatrix(matrix, 1)}');
  print('Target -21: ${solver.searchMatrix(matrix, -21)}');
  print('Target 100: ${solver.searchMatrix(matrix, 100)}');
}

class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    // target не попадает в матрицу вообще
    if (matrix[0].first > target || matrix[matrix.length - 1].last < target) {
      return false;
    }

    //
    int rowIndex = 0;
    for (int i = 0; i < matrix.length; i++) {
      if (matrix[i].first <= target && matrix[i].last >= target) {
        rowIndex = i;
        break;
      }
    }

    if (matrix[rowIndex].length == 1) {
      return matrix[rowIndex][0] == target ? true : false;
    }

    int start = 0;
    int end = matrix[rowIndex].length - 1;

    while (start <= end) {
      final middle = (start + end) ~/ 2;

      final value = matrix[rowIndex][middle];

      if (value == target) {
        return true;
      }

      if (value > target) {
        end = middle - 1;
      } else {
        start = middle + 1;
      }
    }

    return false;
  }
}
