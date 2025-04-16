import 'dart:collection';

class Solution {
  int countGood(List<int> nums, int k) {
    int n = nums.length;
    int l = 0, r = 0, best = 0;
    HashMap<int, int> map = HashMap();
    void plusOne(HashMap<int, int> map, int key) {
      map.update(key, (value) => value + 1, ifAbsent: () => 1);
    }

    void minusOne(HashMap<int, int> map, int key) {
      map.update(key, (value) => value - 1);
      if (map[key] == 0) {
        map.remove(key);
      }
    }

    int pairs = 0;

    int rangeSum(int n) => (((n - 1) * (n)) ~/ 2);

    while (r < n) {
      int oldSum = rangeSum(map[nums[r]] ?? 0);
      plusOne(map, nums[r]);
      int newSum = rangeSum(map[nums[r]]!);

      pairs = pairs - oldSum + newSum;

      while (pairs >= k) {
        best += n - r;
        int oldSum = rangeSum(map[nums[l]]!);
        minusOne(map, nums[l]);
        int newSum = rangeSum(map[nums[l]] ?? 0);
        pairs = pairs - oldSum + newSum;
        l++;
      }
      r++;
    }

    return best;
  }
}
