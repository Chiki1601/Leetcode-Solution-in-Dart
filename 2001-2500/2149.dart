class Solution {
  List<int> rearrangeArray(List<int> nums) {
      final List<int> pos = [];
      final List<int> neg = [];
      final List<int> ans = [];
      for (var i in nums) {
          if (i < 0) {
              neg.add(i);
          } else {
              pos.add(i);
          }
      }

      for (int j = 0; j < pos.length; j++) {
          ans.add(pos[j]);
          ans.add(neg[j]);
      }

      return ans;
  }
}
