import 'dart:math';

import 'package:algorithms/leetcode/tree_node.dart';

/// 104. Maximum Depth of Binary Tree
/// https://leetcode.com/problems/maximum-depth-of-binary-tree/
///
/// Given the root of a binary tree, return its maximum depth.
///
/// A binary tree's maximum depth is the number of nodes along the longest
/// path from the root node down to the farthest leaf node.

class Solution {
  int maxDepth(TreeNode? root) {
    int visit(TreeNode? node) {
      if (node == null) {
        return 0;
      }

      final left = visit(node.left) + 1;
      final right = visit(node.right) + 1;

      return max(left, right);
    }

    return visit(root);
  }
}
