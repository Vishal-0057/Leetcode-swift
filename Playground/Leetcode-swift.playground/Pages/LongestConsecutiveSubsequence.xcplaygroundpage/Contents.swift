//: [Previous](@previous)

/*

 Leetcode - 128. Longest Consecutive Sequence - Medium

 Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

 You must write an algorithm that runs in O(n) time.


 Example 1:
 Input: nums = [100,4,200,1,3,2]
 Output: 4
 Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

 Example 2:
 Input: nums = [0,3,7,2,5,8,4,6,0,1]
 Output: 9

 Example 3:
 Input: nums = [1,0,1,2]
 Output: 3


 Constraints:

 0 <= nums.length <= 105
 -109 <= nums[i] <= 109
 */

import Foundation

class Solution {
    /// Finds the length of the longest consecutive elements sequence
    /// - Parameter nums: An unsorted array of integers
    /// - Returns: The length of the longest consecutive sequence
    /// - Complexity: Time O(n), Space O(n)
    func longestConsecutive(_ nums: [Int]) -> Int {
        // Handle empty array
        guard !nums.isEmpty else { return 0 }

        // Convert to set for O(1) lookups
        let numSet = Set(nums)
        var longestSequence = 0

        // Iterate through unique numbers
        for num in numSet {
            // Only start counting from sequence starts
            // (numbers where num-1 doesn't exist)
            guard !numSet.contains(num - 1) else {
                continue  // Not a sequence start, skip
            }

            // Count consecutive numbers from this start
            var currentSequence = 1
            var nextNum = num + 1

            while numSet.contains(nextNum) {
                currentSequence += 1
                nextNum += 1
            }

            // Update maximum
            longestSequence = max(longestSequence, currentSequence)
        }
        return longestSequence
    }
}

// Return Both length and sequence
class Solution1 {
    /// Finds the length of the longest consecutive elements sequence
    /// - Parameter nums: An unsorted array of integers
    /// - Returns: The length of the longest consecutive sequence
    /// - Complexity: Time O(n), Space O(n)
    func longestConsecutive(_ nums: [Int]) -> (length: Int, sequence: [Int]) {
        // Handle empty array
        guard !nums.isEmpty else { return (0, []) }

        // Convert to set for O(1) lookups
        let numSet = Set(nums)
        var longestLength = 0
        var longestSequence: [Int] = []

        // Iterate through unique numbers
        for num in numSet {
            // Only start counting from sequence starts
            // (numbers where num-1 doesn't exist)
            guard !numSet.contains(num - 1) else {
                continue  // Not a sequence start, skip
            }

            // Count consecutive numbers from this start
            var currentSequence = [num]
            var nextNum = num + 1

            while numSet.contains(nextNum) {
                currentSequence.append(nextNum)
                nextNum += 1
            }

            // Update maximum
            if currentSequence.count > longestLength {
                longestLength = currentSequence.count
                longestSequence = currentSequence
            }
        }
        return (longestLength, longestSequence)
    }
}

print(Solution().longestConsecutive([100,4,200,1,3,2]))
print(Solution().longestConsecutive([1,0,1,2]))
print(Solution().longestConsecutive([0,3,7,2,5,8,4,6,0,1]))
//: [Next](@next)
