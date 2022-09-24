import 'dart:math';

/// 309. Best Time to Buy and Sell Stock with Cooldown
/// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
///
/// You are given an array prices where prices[i] is the price of a given
/// stock on the ith day.
///
/// Find the maximum profit you can achieve. You may complete as many transactions
/// as you like (i.e., buy one and sell one share of the stock multiple times)
/// with the following restrictions:
///
/// After you sell your stock, you cannot buy stock on the next day
/// (i.e., cooldown one day).
///
/// Note: You may not engage in multiple transactions simultaneously
/// (i.e., you must sell the stock before you buy again).
///
/// Example 1:
///
/// Input: prices = [1,2,3,0,2]
/// Output: 3
/// Explanation: transactions = [buy, sell, cooldown, buy, sell]

void main() {
  final prices = [1, 2, 3, 0, 2];
  print(Solution().maxProfit([1, 2, 3, 0, 2]));
}

class Solution {
  int maxProfit(List<int> prices) {
    final List<List<int>> dp = [
      List<int>.filled(prices.length, -1),
      List<int>.filled(prices.length, -1),
    ];

    int findMaxProfit(int index, int buy) {
      if (index >= prices.length) {
        return 0;
      }
      if (dp[buy][index] != -1) {
        return dp[buy][index];
      }

      if (buy == 0) {
        final notBuying = findMaxProfit(index + 1, 0);
        final buying = -prices[index] + findMaxProfit(index + 1, 1);
        dp[buy][index] = max(buying, notBuying);
      } else {
        final selling = prices[index] + findMaxProfit(index + 2, 0);
        final notSelling = findMaxProfit(index + 1, 1);
        dp[buy][index] = max(selling, notSelling);
      }

      print('${dp[0]}\n${dp[1]}\n');

      return dp[buy][index];
    }

    final profit = findMaxProfit(0, 0);

    return profit;
  }
}
