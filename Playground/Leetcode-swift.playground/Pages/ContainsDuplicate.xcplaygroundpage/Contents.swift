//: [Previous](@previous)

import Foundation
/*
 Leet code - 217 - Easy

 Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.



 Example 1:

 Input: nums = [1,2,3,1]

 Output: true

 Explanation:

 The element 1 occurs at the indices 0 and 3.

 Example 2:

 Input: nums = [1,2,3,4]

 Output: false

 Explanation:

 All elements are distinct.

 Example 3:

 Input: nums = [1,1,1,3,3,4,3,2,4,2]

 Output: true



 Constraints:

 1 <= nums.length <= 105
 -109 <= nums[i] <= 109
 */


class SolutionCheckDuplicates {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        // Create an empty set of integers
        var numSet = Set<Int>()
        // iterate over all the numbers given
        for num in nums {
            // try to insert each number and check if number is inserted
            // if not, return True
            // if yes, continue with next number.
            if !numSet.insert(num).inserted {
                return true
            }
        }
        // return false, if all the numbers are inserted. No Duplicates
        return false
    }
}

SolutionCheckDuplicates().containsDuplicate([1,1,1,3,3,4,3,2,4,2])
SolutionCheckDuplicates().containsDuplicate([1,2,3,4])
SolutionCheckDuplicates().containsDuplicate([1,2,3,1])

//: [Next](@next)
