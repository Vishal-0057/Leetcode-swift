
/*
 Leet code - 41. First Missing Positive - HARD

 Given an unsorted integer array nums. Return the smallest positive integer that is not present in nums.

 You must implement an algorithm that runs in O(n) time and uses O(1) auxiliary space.



 Example 1:

 Input: nums = [1,2,0]
 Output: 3
 Explanation: The numbers in the range [1,2] are all in the array.
 Example 2:

 Input: nums = [3,4,-1,1]
 Output: 2
 Explanation: 1 is in the array but 2 is missing.
 Example 3:

 Input: nums = [7,8,9,11,12]
 Output: 1
 Explanation: The smallest positive integer 1 is missing.


 Constraints:

 1 <= nums.length <= 105
 -231 <= nums[i] <= 231 - 1
 */

/// Finds the smallest missing positive integer from the given unsorted array using O(n) time and O(1) space.
/// The algorithm rearranges the elements to their corresponding indices (value i at index i-1),
/// then identifies the first position where this condition is not met, indicating the missing positive integer.
class Solution {
    /**
     Finds the smallest missing positive integer in an unsorted integer array.
     
     - Parameters:
        - nums: An unsorted array of integers
     - Returns: The smallest missing positive integer not present in the array
     
     The algorithm rearranges elements such that each positive integer x is placed at index x-1,
     if possible. It then scans the array to find the first index i where nums[i] != i+1,
     indicating the smallest missing positive integer is i+1. If all are in place, returns n+1.
    */
    func firstMissingPositive(_ nums: [Int]) -> Int {

        var nums = nums
        let n = nums.count
        
        // Rearrange the array so that if nums[i] = x, then nums[x-1] = x (if possible)
        for i in 0..<n {
            while nums[i] > 0 && nums[i] <= n && nums[nums[i] - 1] != nums[i] {
                nums.swapAt(i, nums[i] - 1)
            }
        }
        
        // After rearrangement, the first index i where nums[i] != i+1
        // indicates that i+1 is the smallest missing positive integer
        for i in 0..<n {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        
        // If all positions contain the correct integers,
        // then the smallest missing positive is n + 1
        return n + 1
    }
    
    /// Runs sample test cases to validate the implementation of firstMissingPositive
    func test() {
        print(firstMissingPositive([1, 2, 0]))  // Output: 3

        print(firstMissingPositive([3, 4, -1, 1]))  // Output: 2

        print(firstMissingPositive([7, 8, 9, 11, 12]))  // Output: 1

        print(firstMissingPositive([1, 1]))  // Output: 2
    }
}

/*
 If we are thinking of optimised solution without considering the increased space complexity, we can go with a new data structure to be used as Set.
 */

//Finds the smallest missing positive integer from the given unsorted array using O(n) time and O(n) space.
func firstMissingPositive(_ nums: [Int]) -> Int {

    let numSet = Set(nums)
    print("NumSet ", numSet)
    for num in 1...nums.count+1 {
        print("Num ", num)
        guard numSet.contains(num) else {
            print("NumSet does not contain ", num)
            return num;
        }
        print("NumSet contains ", num)
        continue
    }
    print("NumSet contains all ")
    return nums.count+1
}


Solution().test()
