import 'package:algorithms/leetcode/list_node.dart';

/// 83. Remove Duplicates from Sorted List
/// https://leetcode.com/problems/remove-duplicates-from-sorted-list/
/// Given the head of a sorted linked list, delete all duplicates such that each
/// element appears only once. Return the linked list sorted as well.

class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    ListNode? current = head;

    while (current != null) {
      if (current.val == current.next?.val) {
        current.next = current.next?.next;
        continue;
      }
      current = current.next;
    }

    return head;
  }
}
