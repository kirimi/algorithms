/// 67. Add Binary
/// https://leetcode.com/problems/add-binary/
///
/// Given two binary strings a and b, return their sum as a binary string.

void main() {
  final a = '10011';
  final b = '100111';
  print('$a + $b = ${Solution().addBinary(a, b)}');
}

class Solution {
  String addBinary(String a, String b) {
    String sum = '';

    int aIndex = a.length - 1;
    int bIndex = b.length - 1;

    bool reminder = false;
    while (aIndex >= 0 || bIndex >= 0) {
      final aMem = aIndex < 0 ? '0' : a[aIndex];
      final bMem = bIndex < 0 ? '0' : b[bIndex];

      if (aMem == '0' && bMem == '0') {
        if (reminder) {
          sum = '1$sum';
        } else {
          sum = '0$sum';
        }
        reminder = false;
      } else if (aMem == '1' && bMem == '1') {
        if (reminder) {
          sum = '1$sum';
        } else {
          sum = '0$sum';
        }
        reminder = true;
      } else {
        if (reminder) {
          sum = '0$sum';
          reminder = true;
        } else {
          sum = '1$sum';
          reminder = false;
        }
      }

      aIndex--;
      bIndex--;
    }

    if (reminder) {
      sum = '1$sum';
    }

    return sum;
  }
}
