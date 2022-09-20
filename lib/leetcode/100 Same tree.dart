import 'dart:collection';

import 'tree_node.dart';

/// 100. Same tree
/// https://leetcode.com/problems/same-tree/
/// Given the roots of two binary trees p and q, write a function to check if they are the same or not.
/// Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

void main() {
  final tree1same =
      TreeNode(1, TreeNode(2, null, null), TreeNode(3, null, null));
  final tree2same =
      TreeNode(1, TreeNode(2, null, null), TreeNode(3, null, null));

  final tree1diff =
      TreeNode(1, TreeNode(2, null, null), TreeNode(3, null, null));
  final tree2diff = TreeNode(
      1, TreeNode(2, null, null), TreeNode(3, TreeNode(4, null, null), null));

  final solver = Solution2();

  print('Same: ${solver.isSameTree(tree1same, tree2same)}');
  print('Different: ${solver.isSameTree(tree1diff, tree2diff)}');
}

/// Используя 2 очереди
class Solution {
  bool isSameTree(TreeNode? p, TreeNode? q) {
    final Queue<TreeNode?> pQueue = Queue();
    final Queue<TreeNode?> qQueue = Queue();

    pQueue.add(p);
    qQueue.add(q);

    while (pQueue.isNotEmpty || qQueue.isNotEmpty) {
      final pComp = pQueue.removeFirst();
      final qComp = qQueue.removeFirst();

      if (pComp?.val != qComp?.val) {
        return false;
      }

      if (pComp == null && qComp == null) {
        continue;
      }

      pQueue.add(pComp?.left);
      pQueue.add(pComp?.right);
      qQueue.add(qComp?.left);
      qQueue.add(qComp?.right);
    }

    return pQueue.isEmpty && qQueue.isEmpty;
  }
}

/// Используя рекурсию
class Solution2 {
  bool isSameTree(TreeNode? p, TreeNode? q) {
    if (p == null && q == null) {
      return true;
    }

    if (p == null || q == null) {
      return false;
    }

    if (p.val != q.val) {
      return false;
    }

    return isSameTree(p.left, q.left) && isSameTree(p.right, q.right);
  }
}
