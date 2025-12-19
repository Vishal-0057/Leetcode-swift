//: [Previous](@previous)

/*
 Leet code - 567. Permutation in String - Medium

 Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.

 In other words, return true if one of s1's permutations is the substring of s2.



 Example 1:

 Input: s1 = "ab", s2 = "eidbaooo"
 Output: true
 Explanation: s2 contains one permutation of s1 ("ba").
 Example 2:

 Input: s1 = "ab", s2 = "eidboaoo"
 Output: false


 Constraints:

 1 <= s1.length, s2.length <= 104
 s1 and s2 consist of lowercase English letters.
 */

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        // Edge case: s1 longer than s2
        guard s1.count <= s2.count else {
            return false
        }
        // Convert to arrays for O(1) indexing
        let s1Chars = Array(s1)
        let s2Chars = Array(s2)
        // Build frequency map for s1
        var s1FreqMap = [Character: Int]()
        for char in s1Chars {
            s1FreqMap[char, default: 0] += 1
        }
        // Sliding window frequency map
        var windowFreqMap = [Character: Int]()
        // Initialise first window
        for i in 0..<s1.count {
            windowFreqMap[s2Chars[i], default: 0] += 1
        }
        // check if first frequency matches
        if windowFreqMap == s1FreqMap {
            return true
        }
        // Slide the window across s2
        for i in s1.count..<s2.count {
            // Add new character to window
            let newChar = s2Chars[i]
            windowFreqMap[newChar, default: 0] += 1
            // Remove old character from window
            let oldChar = s2Chars[i - s1.count]
            windowFreqMap[oldChar]! -= 1
            if windowFreqMap[oldChar] == 0 {
                windowFreqMap.removeValue(forKey: oldChar)
            }
            // Check if current window matches
            if windowFreqMap == s1FreqMap {
                return true
            }
        }

        return false
    }
}
//: [Next](@next)
