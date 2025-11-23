//: [Previous](@previous)

/*
 Leet code - 242. Valid Anagram - Easy

 Given two strings s and t, return true if t is an anagram of s, and false otherwise.



 Example 1:

 Input: s = "anagram", t = "nagaram"

 Output: true

 Example 2:

 Input: s = "rat", t = "car"

 Output: false



 Constraints:

 1 <= s.length, t.length <= 5 * 104
 s and t consist of lowercase English letters.


 Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?
 */
import Foundation

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {

        guard s.count == t.count else {
            return false
        }

        var charCount = [Character: Int]()

        for (char1, char2) in zip(s, t) {
            charCount[char1, default: 0] += 1
            charCount[char2, default: 0] -= 1
        }

        return charCount.values.allSatisfy { $0 == 0 }
    }

    func areAnagrams(_ s1: String, _ s2: String) -> Bool {
        guard s1.count == s2.count else { return false }
        var charCount = [Character: Int]()

        for char in s1 {
            charCount[char, default: 0] += 1
        }

        for char in s2 {
            charCount[char, default: 0] -= 1
        }

        return charCount.values.allSatisfy { $0 == 0 }
    }
}

print(Solution().areAnagrams("anagram", "nagaram"))
print(Solution().areAnagrams("rat", "car"))


//: [Next](@next)
