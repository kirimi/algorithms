import "dart:collection";

/// Посчитать сумму листьев (нод в которых нет потомков).

void main() {
  final tree = Node(1, Node(2, Node(3, null, null), null),
      Node(4, Node(5, null, null), Node(6, null, null)));

  final sum1 = sumOfLeafs(tree);
  final sum2 = sumOfLeafs2(tree);

  print('Sum1 $sum1, Sum2 $sum2');
}

class Node {
  final int value;
  final Node? left;
  final Node? right;

  const Node(this.value, this.left, this.right);
}

/// Рекурсивная реализация
int sumOfLeafs(Node node) {
  if (node.left == null && node.right == null) {
    return node.value;
  }

  int sum = 0;

  if (node.left != null) {
    sum += sumOfLeafs(node.left!);
  }

  if (node.right != null) {
    sum += sumOfLeafs(node.right!);
  }

  return sum;
}

/// Итеративная реализация
int sumOfLeafs2(Node node) {
  int sum = 0;

  final Queue<Node> queue = Queue();
  queue.add(node);

  while (queue.isNotEmpty) {
    final curr = queue.removeLast();

    if (curr.left == null && curr.right == null) {
      sum += curr.value;
      continue;
    }

    if (curr.left != null) {
      queue.add(curr.left!);
    }

    if (curr.right != null) {
      queue.add(curr.right!);
    }
  }

  return sum;
}
