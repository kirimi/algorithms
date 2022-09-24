import 'package:algorithms/leetcode/list_node.dart';

/// 24. Swap Nodes in Pairs
/// https://leetcode.com/problems/swap-nodes-in-pairs/
///
/// Given a linked list, swap every two adjacent nodes and return its head.
/// You must solve the problem without modifying the values in the list's nodes
/// (i.e., only nodes themselves may be changed.)

class Solution {
  ListNode? swapPairs(ListNode? head) {
    if (head == null) {
      return null;
    }

    if (head.next == null) {
      return head;
    }

    ListNode? res = head.next;
    ListNode? curr = head.next;
    ListNode? prev = head;

    head = curr;

    while (true) {
      ListNode? next = curr?.next;

      curr?.next = prev;
      if (next == null || next.next == null) {
        prev?.next = next;
        break;
      }
      prev?.next = next.next;

      prev = next;
      curr = prev.next;
    }
    return res;
  }
}
