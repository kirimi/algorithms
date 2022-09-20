import 'list_node.dart';

/// 141. Linked List Cycle
/// https://leetcode.com/problems/linked-list-cycle/
///
/// Given head, the head of a linked list, determine if the linked list
/// has a cycle in it.
///
/// There is a cycle in a linked list if there is some node in the list that
/// can be reached again by continuously following the next pointer.
/// Internally, pos is used to denote the index of the node that tail's
/// next pointer is connected to. Note that pos is not passed as a parameter.
///
/// Return true if there is a cycle in the linked list. Otherwise, return false.

void main() {
  final ListNode node1;
  final ListNode node2;
  final ListNode node3;
  final ListNode node4;

  node1 = ListNode(1, null);
  node2 = ListNode(2, node1);
  node3 = ListNode(3, node2);
  node4 = ListNode(4, node3);

  node1.next = node4;

  print('LinkedList has cycle = ${hasCycle(node4)}');
}

bool hasCycle(ListNode root) {
  final Set<ListNode?> alreadySeen = {};
  ListNode? node = root;
  while (node != null) {
    if (alreadySeen.add(node)) {
      return true;
    }
    node = node.next;
  }
  return false;
}

bool hasCycleTwoPointers(ListNode root) {
  ListNode? fast = root;
  ListNode? slow = root;

  while (fast?.next != null && fast?.next?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
    print('${slow?.val} = ${fast?.val}');
    if (fast == slow) {
      return true;
    }
  }
  return false;
}
