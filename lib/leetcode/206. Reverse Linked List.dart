import 'package:algorithms/leetcode/list_node.dart';

/// 206. Reverse Linked List
/// https://leetcode.com/problems/reverse-linked-list/
///
/// Given the head of a singly linked list, reverse the list,
/// and return the reversed list.
///

class Solution {
  ListNode? reverseList(ListNode? head) {
    ListNode? current = head?.next;
    ListNode? prev = head;

    prev?.next = null;

    while (current != null) {
      final next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }

    return prev;
  }
}
