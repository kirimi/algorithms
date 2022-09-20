import '../tree/binary_node.dart';

/// If you prefer you could use Comparable<E> instead of Comparable<dynamic>.
/// However, int doesn’t directly implement Comparable; its superclass num does.
/// That makes it so that users of your class would have to use num when they
/// really want int. Using Comparable<dynamic>, on the other hand,
/// allows them to use int directly.
class BinarySearchTree<E extends Comparable<dynamic>> {
  BinaryNode<E>? root;

  void insert(E value) {
    root = _insertAt(root, value);
  }

  bool contains(E value) {
    var current = root;
    while (current != null) {
      if (current.value == value) {
        return true;
      }
      if (value.compareTo(current.value) < 0) {
        current = current.leftChild;
      } else {
        current = current.rightChild;
      }
    }

    return false;
  }

  void remove(E value) {
    root = _remove(root, value);
  }

  BinaryNode<E>? _remove(BinaryNode<E>? node, E value) {
    if (node == null) return null;
    if (value == node.value) {
      if (node.leftChild == null && node.rightChild == null) {
        return null;
      }
      if (node.leftChild == null) {
        return node.rightChild;
      }
      if (node.rightChild == null) {
        return node.leftChild;
      }
      node.value = node.rightChild!.min.value;
      node.rightChild = _remove(node.rightChild, node.value);
    } else if (value.compareTo(node.value) < 0) {
      node.leftChild = _remove(node.leftChild, value);
    } else {
      node.rightChild = _remove(node.rightChild, value);
    }
    return node;
  }

  BinaryNode<E> _insertAt(BinaryNode<E>? node, E value) {
    if (node == null) {
      return BinaryNode(value);
    }

    if (value.compareTo(node.value) < 0) {
      if (node.leftChild == null) {
        node.leftChild = BinaryNode(value);
      } else {
        _insertAt(node.leftChild!, value);
      }
    } else {
      if (node.rightChild == null) {
        node.rightChild = BinaryNode(value);
      } else {
        _insertAt(node.rightChild!, value);
      }
    }

    return node;
  }

  @override
  String toString() => root.toString();
}

extension _MinFinder<E> on BinaryNode<E> {
  BinaryNode<E> get min => leftChild?.min ?? this;
}

void main() {
  final tree = BinarySearchTree<int>();

  tree.insert(10);
  tree.insert(1);
  tree.insert(4);
  tree.insert(0);
  tree.insert(2);
  tree.insert(5);
  tree.insert(15);
  tree.insert(17);
  tree.insert(13);
  print(tree);
  tree.remove(1);
  print(tree);
}
