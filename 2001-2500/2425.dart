class Solution {
  int xorAllNums(List<int> nums1, List<int> nums2) {
    int res = 0;
    if (nums2.length % 2 == 1){
        res ^= nums1.reduce((a, b) => a ^ b);
    }
    if (nums1.length % 2 == 1){
        res ^= nums2.reduce((a, b) => a ^ b);
    }
    return res;
  }
}
