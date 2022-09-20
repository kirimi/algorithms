import 'dart:collection';

import 'tree_node.dart';

void main() {
  final tree = TreeNode(
      1,
      TreeNode(2, TreeNode(3, null, null), TreeNode(4, null, null)),
      TreeNode(2, TreeNode(4, null, null), TreeNode(3, null, null)));

  final solver = Solution();

  print('Symmetric: ${solver.isSymmetric(tree)}');
}

/// 101. Symmetric Tree
/// https://leetcode.com/problems/symmetric-tree/
///
/// Given the root of a binary tree, check whether it is a mirror of itself
/// (i.e., symmetric around its center).
class Solution {
  bool isSymmetric(TreeNode? root) {
    Queue<TreeNode?> qLeft = Queue();
    Queue<TreeNode?> qRight = Queue();

    qLeft.add(root?.left);
    qRight.add(root?.right);

    while (qLeft.isNotEmpty && qRight.isNotEmpty) {
      final left = qLeft.removeLast();
      final right = qRight.removeLast();

      if (left?.val != right?.val) {
        return false;
      }
      if (left != null && right != null) {
        qLeft.add(left.left);
        qLeft.add(left.right);

        qRight.add(right.right);
        qRight.add(right.left);
      }
    }

    return true;
  }
}
