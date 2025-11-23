//: [Previous](@previous)

/*
 Leet Code - 1 (Easy)

 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.



 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]


 Constraints:

 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 Only one valid answer exists.


 Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?
 */




class SolutionHashMapWithArray {
    func twoSum(array: [Int], target: Int) -> [Int] {
        // create a map to store the complement number and its index in the dictionary
        var map: [Int: Int] = [:]
        // iterate through the enumerated array to get the current value and its index.
        for (index, currentValue) in array.enumerated() {
            // calculate the complement of the current number
            let complement = target - currentValue
            // check if the complement is already present in the map
            if let previousIndex = map[complement] {
                // If found, return the indices of the complement(previousIndex) and current number(index)
                return [previousIndex, index]  // Ascending order
            }
            // Add current number and its index to the map
            map[currentValue] = index
        }
        // Return an empty array, if no solution is found (this case won't occur as per the problems constraints
        return []
    }
}

let sol1 = SolutionHashMapWithArray()
print(sol1.twoSum(array: [2, 7, 11, 15], target: 9))
print(sol1.twoSum(array: [3,2,4], target: 6))
print(sol1.twoSum(array: [3,3], target: 6))


//: [Next](@next)
