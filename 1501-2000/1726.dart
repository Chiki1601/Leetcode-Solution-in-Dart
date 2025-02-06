class Solution {
  int tupleSameProduct(List<int> nums) {
  int numberOftuples = 0;
  Map<int, int> map = {};
  for (int i = 0; i < nums.length; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      int product = nums[i] * nums[j];
      if (map.containsKey(product)) {
        numberOftuples += map[product]! * 8;
        map[product] = map[product]! + 1;
      } else {
        map[product] = 1;
      }
    }
  }
  return numberOftuples;
  }
}
