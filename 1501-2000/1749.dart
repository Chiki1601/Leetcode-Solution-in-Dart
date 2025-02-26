import 'dart:math';
class Solution {
  int maxAbsoluteSum(List<int> nums) {
    return max(sum(nums, 1), sum(nums, -1));
  }
  int sum(List<int> nums, int x){
    int res = 0, prev = 0, cur = 0;
    for (final n in nums){
      final cur = n * x;
      res = max(res, prev);
      prev = max(0, prev + cur);
    }
    res = max(res, prev);
    return res;
  }
}
