/// 22. Generate Parentheses
/// https://leetcode.com/problems/generate-parentheses/
///
/// Given n pairs of parentheses, write a function to generate all
/// combinations of well-formed parentheses.

void main() {
  final solution = Solution().generateParenthesis(4);
  print(solution);
  print(solution.length);
}

class Solution {
  List<String> generateParenthesis(int n) {
    final List<String> solution = [];

    void generate(int toOpen, int toClose, String str) {
      if (toOpen == 0 && toClose == 0) {
        solution.add(str);
        return;
      }

      if (toOpen > 0) {
        generate(toOpen - 1, toClose + 1, '$str(');
      }

      if (toClose > 0) {
        generate(toOpen, toClose - 1, '$str)');
      }
    }

    generate(n, 0, '');

    return solution;
  }
}
