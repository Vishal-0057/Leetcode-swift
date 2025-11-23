//: [Previous](@previous)

import Foundation

/*
 Leet code - 219 - Easy

 Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.



 Example 1:

 Input: nums = [1,2,3,1], k = 3
 Output: true
 Example 2:

 Input: nums = [1,0,1,1], k = 1
 Output: true
 Example 3:

 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false


 Constraints:

 1 <= nums.length <= 105
 -109 <= nums[i] <= 109
 0 <= k <= 105
 */


class SolutionCheckDuplicatesMoreOptional {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        guard k > 0, nums.count > 1 else { return false }

        var window = Set<Int>()

        for (index, number) in nums.enumerated() {
            print(window)
            // If number is in our k-sized window, we found a duplicate
            if window.contains(number) {
                return true
            }

            // Add current number to window
            window.insert(number)

            // Keep window size at most k
            if index >= k {
                window.remove(nums[index - k])
            }
        }

        return false
    }
}


class SolutionCheckDuplicates2 {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        // Create an empty Dictionary to store the visited index and their values as keys.
        // The constaint on this map is that it should be of size k+1, Like a Sliding window.
        // Window size is k.
        var map = [Int: Int]()
        // Iterate over the enumerated nums array
        for (index, number) in nums.enumerated() {
            print(map)
            // check if the number already exists in the map dictionary
            if let previousIndexOfNumber = map[number] {
                // if number already existed, means array contains duplicates
                return true
            }
            // if number does not exists in the dictionary, then insert the number as key in the map and index as value.
            map[number] = index
            // if the map count increases from k values, then remove the key value pair of the with key as index - k and its value.
            if map.count > k {
                map.removeValue(forKey: nums[index - k])
            }
        }
        return false;
    }
}

print(SolutionCheckDuplicates2().containsNearbyDuplicate([1,2,3,1], 3))
print(SolutionCheckDuplicates2().containsNearbyDuplicate([1,0,1,1], 1))
print(SolutionCheckDuplicates2().containsNearbyDuplicate([1, 2, 3, 1, 2], 2))

/// Sub-optimal solution
/// Better readability

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var map = [Int: Int]()
        for (index, number) in nums.enumerated() {
            print(map)
            if let previousIndexOfNumber = map[number] {
                if abs(index - previousIndexOfNumber) <= k {
                    return true
                }
            }
            map[number] = index
        }
        return false;
    }
}
print(Solution().containsNearbyDuplicate([1, 2, 3, 1, 2], 2))
print(SolutionCheckDuplicatesMoreOptional().containsNearbyDuplicate([1, 2, 3, 1, 2], 2))

//: [Next](@next)
