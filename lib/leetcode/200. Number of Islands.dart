/// 200. Number of Islands
/// https://leetcode.com/problems/number-of-islands/
///
/// Given an m x n 2D binary grid grid which represents a map of '1's (land)
/// and '0's (water), return the number of islands.
///
/// An island is surrounded by water and is formed by connecting adjacent
/// lands horizontally or vertically. You may assume all four edges of
/// the grid are all surrounded by water.

void main() {
  final matrix = [
    ["1", "1", "1", "1", "1", "0", "1", "1", "1", "1"],
    ["1", "0", "1", "0", "1", "1", "1", "1", "1", "1"],
    ["0", "1", "1", "1", "0", "1", "1", "1", "1", "1"],
    ["1", "1", "0", "1", "1", "0", "0", "0", "0", "1"],
    ["1", "0", "1", "0", "1", "0", "0", "1", "0", "1"],
    ["1", "0", "0", "1", "1", "1", "0", "1", "0", "0"],
    ["0", "0", "1", "0", "0", "1", "1", "1", "1", "0"],
    ["1", "0", "1", "1", "1", "0", "0", "1", "1", "1"],
    ["1", "1", "1", "1", "1", "1", "1", "1", "0", "1"],
    ["1", "0", "1", "1", "1", "1", "1", "1", "1", "0"]
  ];
  final solver = Solution();
  print(solver.numIslands(matrix));
}

class Solution {
  int numIslands(List<List<String>> grid) {
    int islands = 0;

    final height = grid.length;
    final width = grid[0].length;

    void visit(int x, int y) {
      if (x < 0 ||
          x > width - 1 ||
          y < 0 ||
          y > height - 1 ||
          grid[y][x] != '1') {
        return;
      }

      grid[y][x] = "#";

      visit(x + 1, y);
      visit(x, y + 1);
      visit(x - 1, y);
      visit(x, y - 1);
    }

    for (var y = 0; y < grid.length; y++) {
      for (var x = 0; x < grid[0].length; x++) {
        if (grid[y][x] == '1') {
          islands++;
          visit(x, y);
        }
      }
    }

    return islands;
  }
}
