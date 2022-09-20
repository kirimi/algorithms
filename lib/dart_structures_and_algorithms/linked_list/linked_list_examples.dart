import 'linked_list.dart';
import 'node.dart';

void main() {
  final list = LinkedList<int>()
    ..append(1)
    ..append(2)
    ..append(3);

  printReverseOrder(list);

  final list2 = LinkedList<int>();
  for (int i = 1; i <= 8; i++) {
    list2.append(i);
  }
  print('Middle node: ${findMiddleNode(list2)?.value}');

  final list3 = LinkedList<int>();
  for (int i = 1; i <= 8; i++) {
    list3.append(i);
  }
  print('Nodes: ${list3.head}');
  print('Reversed nodes: ${reverseLinkedList(list3.head!)}');
  print('Reversed nodes O(1) space: ${reverseLinkedList2(list3.head!)}');

  final list4 = LinkedList<int>()
    ..append(1)
    ..append(2)
    ..append(2)
    ..append(32)
    ..append(2)
    ..append(100);

  print(
      'After removeAllOccurrences. List without 2: ${removeAllOccurrences(list4.head!, 2)}');
}

/// Create a function that prints the nodes of a linked list in reverse order.
void printReverseOrder(LinkedList<int> list) {
  void printNodeRecursively(Node? node) {
    if (node == null) return;
    printNodeRecursively(node.next);
    print(node.value);
  }

  printNodeRecursively(list.head);
}

/// Challenge 2: Find the Middle Node
/// Create a function that finds the middle node of a linked list.
///
/// This is known as the runner’s technique.
/// two references traverse down the nodes of the list,
/// where one is twice as fast as the other.
/// Once the faster reference reaches the end,
/// the slower reference will be in the middle.
Node? findMiddleNode<E>(LinkedList<E> list) {
  Node? middle = list.head;
  Node? runner = list.head;

  while (runner?.next != null) {
    runner = runner?.next?.next;
    middle = middle?.next;
  }

  return middle;
}

/// Challenge 3: Reverse a Linked List
/// Create a function that reverses a linked list. You do this by manipulating
/// the nodes so that they’re linked in the other direction.
/// O(N) time + O(N) space
Node<E>? reverseLinkedList<E>(Node<E> root) {
  Node<E>? result;

  Node<E>? node = root;
  while (node != null) {
    result = Node<E>(value: node.value, next: result);
    node = node.next;
  }

  return result;
}

///  O(N) time + O(1) space
Node<E>? reverseLinkedList2<E>(Node<E> root) {
  Node<E>? current = root.next;
  Node<E>? prev = root;

  prev.next = null;

  while (current != null) {
    final next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }

  return prev;
}

/// Challenge 4: Remove All Occurrences
/// Create a function that removes all occurrences of a specific element
/// from a linked list. The implementation is similar to the removeAfter method
/// that you implemented earlier.

Node<E>? removeAllOccurrences<E>(Node<E>? root, int value) {
  // Убираем элементы с начала дерева
  while (root?.value == value) {
    root = root?.next;
  }

  Node<E>? prev;
  Node<E>? current = root;

  while (current != null) {
    if (current.value == value) {
      prev?.next = current.next;
      current = current.next;
    } else {
      prev = current;
      current = current.next;
    }
  }

  return root;
}
