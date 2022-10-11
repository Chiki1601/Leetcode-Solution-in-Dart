class Solution {
  bool increasingTriplet(List<int> nums) {
    dynamic first = double.infinity;
    dynamic second = double.infinity;
    for (var n in nums) {
      if (n <= first) {
        first = n;
      } else if (n <= second) {
        second = n;
      } else {
        return true;
      }
    }
    return false;
  }
}
