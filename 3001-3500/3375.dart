class Solution {
  int minOperations(List<int> nums, int k) {
    List<bool> hasX = List.filled(101, false);
  int xMin = 101;

  for (int x in nums) {
    hasX[x] = true;
    if (x < xMin) xMin = x;
  }

  if (xMin < k) return -1;

  int uniqueCount = hasX.where((val) => val).length;

  return (xMin == k) ? uniqueCount - 1 : uniqueCount;
  }
}
