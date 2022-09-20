import 'package:algorithms/dart_structures_and_algorithms/tree/tree_node.dart';

void main() {
  final root = TreeNode(0);
  root.add(TreeNode(11)..add(TreeNode(111)));
  root.add(TreeNode(12)
    ..add(TreeNode(121))
    ..add(TreeNode(122)));
  root.add(TreeNode(13)
    ..add(TreeNode(131))
    ..add(TreeNode(132))
    ..add(TreeNode(133))
    ..add(TreeNode(134)));

  printLevelOrderTraversal(root);
}

/// Обход по уровням
///
/// Challenge 1: Print a Tree in Level Order
/// Релизация на очереди
void printLevelOrderTraversal<T>(TreeNode<T> node) {
  final List<TreeNode<T>> queue = [];

  TreeNode<T> current = node;
  queue.add(current);

  while (queue.isNotEmpty) {
    current = queue.removeAt(0);
    print(current.value);
    for (final child in current.children) {
      queue.add(child);
    }
  }
}
