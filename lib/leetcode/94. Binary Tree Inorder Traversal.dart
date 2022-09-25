import 'package:algorithms/leetcode/tree_node.dart';

/// 94. Binary Tree Inorder Traversal
/// https://leetcode.com/problems/binary-tree-inorder-traversal/
///
/// Given the root of a binary tree, return the inorder traversal of its nodes' values.

class Solution {
  List<int> inorderTraversal(TreeNode? root) {
    List<int> result = [];

    void visit(TreeNode? node) {
      if (node == null) return;

      visit(node.left);
      result.add(node.val);
      visit(node.right);
    }

    visit(root);

    return result;
  }
}
