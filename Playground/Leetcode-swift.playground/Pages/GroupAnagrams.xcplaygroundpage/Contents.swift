//: [Previous](@previous)

/*
 Leetcode - 49. Group Anagrams - Medium

 Given an array of strings strs, group the anagrams together. You can return the answer in any order.



 Example 1:

 Input: strs = ["eat","tea","tan","ate","nat","bat"]

 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

 Explanation:

 There is no string in strs that can be rearranged to form "bat".
 The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
 The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
 Example 2:

 Input: strs = [""]

 Output: [[""]]

 Example 3:

 Input: strs = ["a"]

 Output: [["a"]]



 Constraints:

 1 <= strs.length <= 104
 0 <= strs[i].length <= 100
 strs[i] consists of lowercase English letters.
 */

// Solutioning::

// 1.
// ideal Brute-Force O(n*n*n)
// Checking valid anagrams also Brute-Force
// iterate over the array and sort each string. Then again iterate and check for equality, and store them in a group.

// 2.
// Iterate the provided array and check for anagram using previous valid anagram approach will make it O(n*n)

// 3.
// Iterate and sort each string will take O(n * log n) to create the sorted strings array. and multiplied by k, here k is the biggest length of the string that we have to compare.
// Final Time complexity : O(n * log n * k)

// 4.
// iterate the array, create a separate array of size 26 of integers for each string, where the items at any index means the character is present that many times in string.
// Create a string code of 26 length out of that array and store its string value in the dictionary as key while the actual string in an array as value.
// repeat the process above for each string, if the code (key matches), append it to the array value already present (grouping).
// then finally iterate once over the dictionary values and arrange them in a array and return as the final outcome.

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // create a groups dictionary to save all the groups with same anagram.
        var groups = [String: [String]]()

        // iterate over the array provided
        for str in strs {
            // Create a new char count array of size 26 with all 0's, to store the count of each character
            var charCount = Array(repeating: 0, count: 26)
            let aUnicode = Int(Character("a").unicodeScalars.first!.value)

            // iterate over all the characters of the string,
            // save all the occurences of each character
            for char in str.lowercased() {
                let charIndex = Int(char.unicodeScalars.first!.value) - aUnicode
                charCount[charIndex] += 1
            }
            // store in the dictionary.
            groups[charCount.description, default: []].append(str)
        }

        // create an array out of dictionary's values
        return Array(groups.values)
    }
}

//print(Solution().groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
//print(Solution().groupAnagrams(["anagram","nagaram","ramnaga","gagan","nagag","vishal"]))
//print(Solution().groupAnagrams(["bdddddddddd","bbbbbbbbbbc"]))



// Sub-optimal but better readability approach
class Solution2 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups = [String: [String]]()

        for str in strs {
            // Sorted string is the key
            let key = String(str.sorted())
            groups[key, default: []].append(str)
        }

        return Array(groups.values)
    }
}

// More optimal solution
class Solution3 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups = [[Character: Int]: [String]]()

        for str in strs {
            // Build frequency map
            var charFreq = [Character: Int]()
            for char in str {
                charFreq[char, default: 0] += 1
            }

            groups[charFreq, default: []].append(str)
        }

        return Array(groups.values)
    }
}

print(Solution3().groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
print(Solution3().groupAnagrams(["anagram","nagaram","ramnaga","gagan","nagag","vishal"]))
print(Solution3().groupAnagrams(["bdddddddddd","bbbbbbbbbbc"]))
//: [Next](@next)
