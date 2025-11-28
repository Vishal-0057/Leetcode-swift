//: [Previous](@previous)


/*
 Leetcode - 953. Verifying an Alien Dictionary - Easy

 In an alien language, surprisingly, they also use English lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

 Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographically in this alien language.



 Example 1:

 Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
 Output: true
 Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
 Example 2:

 Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
 Output: false
 Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
 Example 3:

 Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
 Output: false
 Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).


 Constraints:

 1 <= words.length <= 100
 1 <= words[i].length <= 20
 order.length == 26
 All characters in words[i] and order are English lowercase letters.
 */

import Foundation

class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        // Build order map
        let orderMap = Dictionary(uniqueKeysWithValues: order.enumerated().map { ($1, $0)})

        // Check each adjacent pair
        for (word1, word2) in zip(words, words.dropFirst()) {
            if !isLessThanOrEqual(word1, word2, orderMap) {
                return false
            }
        }

        return true
    }

    private func isLessThanOrEqual(_ word1: String, _ word2: String, _ orderMap: [Character: Int]) -> Bool {
        // Compare character by character using zip
        for (c1, c2) in zip(word1, word2) {
            guard let order1 = orderMap[c1], let order2 = orderMap[c2] else {
                return false
            }
            if order1 < order2 { return true }
            if order1 > order2 { return false }
        }

        // All compared characters are equal, check length
        return word1.count <= word2.count
    }
}

print(Solution().isAlienSorted(["app", "apple"], "abcdefghijklmnopqrstuvwxyz"))
print(Solution().isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz"))
print(Solution().isAlienSorted(["bat","batwoman","batwomen"], "worldabcefghijkmnpqstuvxyz"))

//: [Next](@next)
