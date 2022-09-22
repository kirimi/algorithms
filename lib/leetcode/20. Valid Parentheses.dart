/// 20. Valid Parentheses
/// https://leetcode.com/problems/valid-parentheses/
///
/// Given a string s containing just the characters '(', ')', '{', '}',
/// '[' and ']', determine if the input string is valid.
///
/// An input string is valid if:
///
/// Open brackets must be closed by the same type of brackets.
/// Open brackets must be closed in the correct order.
/// Every close bracket has a corresponding open bracket of the same type.

void main() {
  final solver = Solution();
  print('()[]{} is valid: ${solver.isValid('()[]{}')}');
  print('()[{} is valid: ${solver.isValid('()[{}')}');
}

const openBrackets = ['(', '{', '['];
const closeBrackets = [')', '}', ']'];

class Solution {
  bool isValid(String s) {
    final List<String> stack = [];
    for (int i = 0; i < s.length; i++) {
      if (openBrackets.contains(s[i])) {
        stack.add(s[i]);
      } else {
        if (stack.isEmpty) {
          return false;
        }
        final openIndex = openBrackets.indexOf(stack.last);
        final closeIndex = closeBrackets.indexOf(s[i]);
        if (openIndex != closeIndex) {
          return false;
        }
        stack.removeLast();
      }
    }

    return stack.isEmpty;
  }
}
