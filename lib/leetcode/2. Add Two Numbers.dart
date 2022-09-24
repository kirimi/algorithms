import 'package:algorithms/leetcode/list_node.dart';

/// 2. Add Two Numbers
/// https://leetcode.com/problems/add-two-numbers/
///
/// You are given two non-empty linked lists representing two non-negative integers.
/// The digits are stored in reverse order, and each of their nodes contains
/// a single digit. Add the two numbers and return the sum as a linked list.
///
/// You may assume the two numbers do not contain any leading zero,
/// except the number 0 itself.

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode? tmp1 = l1;
    ListNode? tmp2 = l2;

    ListNode? resultRoot;
    ListNode? currentNode;

    bool remainder = false;
    while (tmp1 != null || tmp2 != null) {
      int addMember1 = 0, addMember2 = 0;
      if (tmp1 != null) {
        addMember1 = tmp1.val;
      }
      if (tmp2 != null) {
        addMember2 = tmp2.val;
      }

      final sum = addMember1 + addMember2 + (remainder ? 1 : 0);

      remainder = false;
      final node = ListNode(0);
      if (sum <= 9) {
        node.val = sum;
      } else {
        node.val = sum - 10;
        remainder = true;
      }

      if (currentNode == null) {
        currentNode = node;
        resultRoot = node;
      } else {
        currentNode.next = node;
        currentNode = node;
      }

      tmp1 = tmp1?.next;
      tmp2 = tmp2?.next;
    }

    if (remainder) {
      currentNode?.next = ListNode(1, null);
    }

    return resultRoot;
  }
}
