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

  printDepthFirstTraversal(root);
}

/// Обход в глубину Depth-First Traversal
/// рекурсивная реализация
void printDepthFirstTraversal<T>(TreeNode<T> node) {
  print(node.value);
  for (final child in node.children) {
    printDepthFirstTraversal(child);
  }
}
