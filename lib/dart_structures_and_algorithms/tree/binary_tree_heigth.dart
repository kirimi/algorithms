import 'dart:math';

import 'binary_node.dart';

void main() {
  final tree = createBinaryTree();
  print(tree);
  print('Pre order');
  tree.traversePreOrder(print);
  print('In order');
  tree.traverseInOrder(print);
  print('Post order');
  tree.traversePostOrder(print);

  print('Tree height = ${binaryTreeHeight(tree)}');
  print('Tree height 2 = ${binaryTreeHeight2(tree)}');
}

BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);
  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;
  return seven;
}

int binaryTreeHeight<E>(BinaryNode<E> root) {
  int maxHeight = 0;

  void updateHeight(BinaryNode<E> node, int level) {
    maxHeight = max(maxHeight, level);
    if (node.leftChild != null) {
      updateHeight(node.leftChild!, level + 1);
    }
    if (node.rightChild != null) {
      updateHeight(node.leftChild!, level + 1);
    }
  }

  updateHeight(root, 0);

  return maxHeight;
}

int binaryTreeHeight2<E>(BinaryNode<E>? node) {
  if (node == null) {
    return -1;
  }

  return 1 +
      max(binaryTreeHeight2(node.leftChild),
          binaryTreeHeight2(node.rightChild));
}
