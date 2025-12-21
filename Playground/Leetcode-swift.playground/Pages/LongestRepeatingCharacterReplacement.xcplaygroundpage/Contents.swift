/*
 Leet code - 424. Longest Repeating Character Replacement - Medium

 You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.

 Return the length of the longest substring containing the same letter you can get after performing the above operations.



 Example 1:

 Input: s = "ABAB", k = 2
 Output: 4
 Explanation: Replace the two 'A's with two 'B's or vice versa.
 Example 2:

 Input: s = "AABABBA", k = 1
 Output: 4
 Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
 The substring "BBBB" has the longest repeating letters, which is 4.
 There may exists other ways to achieve this answer too.


 Constraints:

 1 <= s.length <= 105
 s consists of only uppercase English letters.
 0 <= k <= s.length
 */

// Used when Input Characters are Caps / small-case English language characters only.
class Solution {
    /// Finds the length of the longest substring with at most k replacements
    /// - Parameters:
    ///   - s: Input string (uppercase letters A-Z)
    ///   - k: Maximum number of character replacements allowed
    /// - Returns: Length of longest valid substring
    /// - Complexity: Time O(n), Space O(1)
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        // Edge cases
        guard !s.isEmpty else { return 0 }
        guard k >= 0 else { return 0 }

        // Convert to array for O(1) indexing
        let chars = Array(s)
        let aValue = Int(Character("A").asciiValue ?? 65)  // Safe unwrap for CAPS
//        let aValue = Int(Character("a").asciiValue ?? 97)  // Safe unwrap for SMALL chars

        // Frequency array for 26 uppercase letters
        var frequency = [Int](repeating: 0, count: 26)

        var left = 0
        var maxFrequency = 0  // Max frequency of any character in current window
        var maxLength = 0

        for right in 0..<chars.count {
            // Expand window: add right character
            guard let asciiValue = chars[right].asciiValue else {
                continue  // Skip invalid characters
            }
            let rightIndex = Int(asciiValue) - aValue

            // Validate index range
            guard rightIndex >= 0 && rightIndex < 26 else {
                continue
            }

            frequency[rightIndex] += 1
            maxFrequency = max(maxFrequency, frequency[rightIndex])

            // Shrink window if invalid
            // Window is invalid if: (window_size - max_frequency) > k
            // Meaning: we'd need to replace more than k characters
            while (right - left + 1) - maxFrequency > k {
                let leftIndex = Int(chars[left].asciiValue!) - aValue
                frequency[leftIndex] -= 1
                left += 1
                // Note: We don't update maxFrequency here (optimization)
            }

            // Update result
            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
}


// Used when Input Characters are

//- Mixed case letters
//- Numbers included
//- Unicode characters
//- Unknown character set
//
//---

class SolutionDictionary {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        guard !s.isEmpty, k >= 0 else { return 0 }

        let chars = Array(s)
        var frequency = [Character: Int]()
        var left = 0
        var maxFrequency = 0
        var maxLength = 0

        for right in 0..<chars.count {
            // Add right character
            let currentChar = chars[right]
            let newFreq = (frequency[currentChar] ?? 0) + 1
            frequency[currentChar] = newFreq
            maxFrequency = max(maxFrequency, newFreq)

            // Shrink window if invalid
            while (right - left + 1) - maxFrequency > k {
                let leftChar = chars[left]
                frequency[leftChar]! -= 1

                // Clean up zero frequencies
                if frequency[leftChar] == 0 {
                    frequency.removeValue(forKey: leftChar)
                }

                left += 1
            }

            // Update result
            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
}
