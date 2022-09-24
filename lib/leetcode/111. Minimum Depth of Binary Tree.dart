import 'dart:math';

import 'package:algorithms/leetcode/tree_node.dart';

/// 111. Minimum Depth of Binary Tree
/// https://leetcode.com/problems/minimum-depth-of-binary-tree/
///
/// Given a binary tree, find its minimum depth.
///
/// The minimum depth is the number of nodes along the shortest path from
/// the root node down to the nearest leaf node.
///
/// Note: A leaf is a node with no children.

class Solution {
  int minDepth(TreeNode? root) {
    int visit(TreeNode? node) {
      if (node == null) {
        return 0;
      }

      if (node.left == null && node.right == null) {
        return 1;
      }

      if (node.left == null) {
        return visit(node.right) + 1;
      }

      if (node.right == null) {
        return visit(node.left) + 1;
      }

      return min(visit(node.left), visit(node.right)) + 1;
    }

    return visit(root);
  }
}
