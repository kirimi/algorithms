import 'dart:math';

/// 714. Best Time to Buy and Sell Stock with Transaction Fee
/// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/
///
/// You are given an array prices where prices[i] is the price of a given stock
/// on the ith day, and an integer fee representing a transaction fee.
///
/// Find the maximum profit you can achieve. You may complete as many transactions
/// as you like, but you need to pay the transaction fee for each transaction.
///
/// Note: You may not engage in multiple transactions simultaneously
/// (i.e., you must sell the stock before you buy again).
/// Input: prices = [1,3,2,8,4,9], fee = 2
/// Output: 8
/// Explanation: The maximum profit can be achieved by:
/// - Buying at prices[0] = 1
/// - Selling at prices[3] = 8
/// - Buying at prices[4] = 4
/// - Selling at prices[5] = 9
/// The total profit is ((8 - 1) - 2) + ((9 - 4) - 2) = 8.

void main() {
  final prices = [1, 3, 2, 8, 4, 9];
  print(Solution().maxProfit(prices, 2));
  print(Solution().maxProfit([1, 3, 7, 5, 10, 3], 3));
}

/// At the end of the i-th day, we maintain cash, the maximum profit we could
/// have if we did not have a share of stock, and hold, the maximum
/// profit we could have if we owned a share of stock.
///
/// To transition from the i-th day to the i+1-th day,
/// we either sell our stock cash = max(cash, hold + prices[i] - fee)
/// or buy a stock hold = max(hold, cash - prices[i]).
/// At the end, we want to return cash. We can transform cash first without
/// using temporary variables because selling and buying on the same day can't
/// be better than just continuing to hold the stock.

class Solution {
  int maxProfit(List<int> prices, int fee) {
    int cash = 0;
    int hold = -prices[0];
    for (var i = 1; i < prices.length; i++) {
      cash = max(cash, hold + prices[i] - fee);
      hold = max(hold, cash - prices[i]);
    }
    return cash;
  }
}
