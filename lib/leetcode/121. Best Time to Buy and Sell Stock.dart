import 'dart:math';

/// 121. Best Time to Buy and Sell Stock
/// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
///
/// You are given an array prices where prices[i] is the price of a given
/// stock on the ith day.
///
/// You want to maximize your profit by choosing a single day to buy one stock
/// and choosing a different day in the future to sell that stock.
///
/// Return the maximum profit you can achieve from this transaction. If you
/// cannot achieve any profit, return 0.

void main() {
  final prices = [7, 1, 5, 3, 6, 4];
  print(Solution().maxProfit(prices));
}

class Solution {
  int maxProfit(List<int> prices) {
    int profit = 0;
    int buy = prices[0];

    for (final price in prices) {
      buy = min(buy, price);
      profit = max(profit, price - buy);
    }

    return profit;
  }
}
