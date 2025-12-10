//: [Previous](@previous)

/*
 Leet code - 121. Best Time to buy and sell the Stocks - Easy

 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.



 Example 1:

 Input: prices = [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
 Example 2:

 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transactions are done and the max profit = 0.


 Constraints:

 1 <= prices.length <= 105
 0 <= prices[i] <= 104

 */
import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        var min = prices[0] // 7

        for price in prices { // 4
            if (price < min) { // false
                min = price // 1
            }

            profit = max(profit, price-min) // 5, 3 // 5
        }

        return profit
    }
}

let abc = Solution().maxProfit([7,1,5,3,6,4])
print(abc)


//: [Next](@next)
