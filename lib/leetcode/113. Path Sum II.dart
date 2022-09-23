import 'package:algorithms/leetcode/tree_node.dart';

/// 113. Path Sum II
/// https://leetcode.com/problems/path-sum-ii/
///
/// Given the root of a binary tree and an integer targetSum, return all
/// root-to-leaf paths where the sum of the node values in the path equals targetSum.
/// Each path should be returned as a list of the node values, not node references.
///
/// A root-to-leaf path is a path starting from the root and ending at any leaf node.
/// A leaf is a node with no children.

void main() {
  final root = TreeNode(
    5,
    TreeNode(
      4,
      TreeNode(
        11,
        TreeNode(7),
        TreeNode(2),
      ),
      null,
    ),
    TreeNode(
      8,
      TreeNode(13),
      TreeNode(
        4,
        TreeNode(5),
        TreeNode(1),
      ),
    ),
  );
  print(Solution().pathSum(root, 22));
}

// todo не проходит некоторые тесты типа
// [1]
// 1
class Solution {
  List<List<int>> pathSum(TreeNode? root, int targetSum) {
    final List<List<int>> result = [];

    void visit(TreeNode? node, int sum, List<int> path) {
      if (node == null) {
        return;
      }

      final newSum = node.val + sum;

      if (newSum > targetSum) {
        return;
      }

      path.add(node.val);

      if (newSum == targetSum) {
        result.add(path);
        return;
      }

      visit(node.left, newSum, path.toList());
      visit(node.right, newSum, path.toList());
    }

    visit(root, 0, []);

    // if (root?.left != null) {
    //   visit(root?.left, root?.val ?? 0, [root?.val ?? 0]);
    // }
    //
    // if (root?.right != null) {
    //   visit(root?.right, root?.val ?? 0, [root?.val ?? 0]);
    // }

    return result;
  }
}
