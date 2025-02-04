class Solution {
  int maxAscendingSum(List<int> nums) {
  int sum = 0;
  int max = 0;
  for (int i = 0; i < nums.length; i++) {
    if (i == 0 || nums[i] > nums[i - 1]) {
      sum += nums[i];
    } else {
      sum = nums[i];
    }
     max = sum > max ? sum : max;
  }
  return max;
}
}
