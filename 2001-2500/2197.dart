class Solution {
  List<int> replaceNonCoprimes(List<int> nums) {
    int j = 0;
    int n = nums.length;

    for (int i = 0; i < n; i++, j++) {
      nums[j] = nums[i];

      // keep merging leftwards while gcd > 1
      while (j - 1 >= 0 && _gcd(nums[j], nums[j - 1]) > 1) {
        int g = _gcd(nums[j], nums[j - 1]);
        nums[j - 1] = (nums[j] ~/ g) * nums[j - 1]; // LCM
        j--;
      }
    }

    // resize nums to length j
    nums = nums.sublist(0, j);

    return nums;
  }

  int _gcd(int a, int b) {
    while (b != 0) {
      int tmp = b;
      b = a % b;
      a = tmp;
    }
    return a;
  }
}
