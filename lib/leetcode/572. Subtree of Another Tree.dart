import 'package:algorithms/leetcode/tree_node.dart';

/// 572. Subtree of Another Tree
/// https://leetcode.com/problems/subtree-of-another-tree/
///
/// Given the roots of two binary trees root and subRoot, return true if there
/// is a subtree of root with the same structure and node values of subRoot
/// and false otherwise.
///
/// A subtree of a binary tree tree is a tree that consists of a node in tree
/// and all of this node's descendants. The tree tree could also be considered
/// as a subtree of itself.

class Solution {
  bool isSubtree(TreeNode? root, TreeNode? subRoot) {
    if (root == null && subRoot == null) {
      return true;
    }

    if (subRoot == null) {
      return false;
    }

    bool search(TreeNode? node, int searchVal) {
      if (node == null) {
        return false;
      }
      if (node.val == searchVal) {
        if (compareTree(node, subRoot)) {
          return true;
        }
      }
      return search(node.left, searchVal) || search(node.right, searchVal);
    }

    return search(root, subRoot.val);
  }

  bool compareTree(TreeNode? a, TreeNode? b) {
    if (a == null && b == null) {
      return true;
    }

    if (a?.val != b?.val) {
      return false;
    }

    return compareTree(a?.left, b?.left) && compareTree(a?.right, b?.right);
  }
}
