import "dart:math" as math;
class Solution {
  int jump(List<int> nums) {
    int n = nums.length;

    List<int> dp = List.filled(n, 0);

    for (var i = n - 2; i >= 0; i--) {
      int jump = 1e9.toInt();
      for (var j = 1; j <= nums[i]; j++) {
        if (i + j >= n) break;
        jump = math.min(jump, 1 + dp[i + j]);
      }
      dp[i] = jump;
    }
    return dp[0];
  }
}
