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
    int visit(TreeNode? node, int deep) {
      if (node == null) {
        return deep;
      }

      final left = visit(node.left, deep + 1);
      final right = visit(node.right, deep + 1);

      return max(left, right);
    }

    return visit(root, 0);
  }
}
