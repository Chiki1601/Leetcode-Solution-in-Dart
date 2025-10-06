class Solution {
  int longestSubsequence(List<int> nums) {
    int xorSum = 0;
    bool allZero = true;
    for (int num in nums) {
      xorSum ^= num;
      if (num != 0) allZero = false;
    }
    if (allZero) return 0;
    return xorSum != 0 ? nums.length : nums.length - 1;
  }
}
