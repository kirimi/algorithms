import 'dart:math';

import 'package:algorithms/leetcode/tree_node.dart';

/// 110. Balanced Binary Tree
/// https://leetcode.com/problems/balanced-binary-tree/
///
/// Given a binary tree, determine if it is height-balanced.
///
/// For this problem, a height-balanced binary tree is defined as:
/// a binary tree in which the left and right subtrees of every node differ
/// in height by no more than 1.

class Solution {
  bool isBalanced(TreeNode? root) {
    int visit(TreeNode? node) {
      if (node == null) {
        return 0;
      }

      int left = visit(node.left);
      int right = visit(node.right);

      if (left == -1 || right == -1 || (left - right).abs() > 1) {
        return -1;
      }

      return max(left, right) + 1;
    }

    return visit(root) != -1;
  }
}
