class Solution {
  bool doesValidArrayExist(List<int> derived)  => derived.reduce((a, b) => a ^ b) == 0;
  
}
