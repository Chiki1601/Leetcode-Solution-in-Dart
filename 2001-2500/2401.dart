class Solution {
  int longestNiceSubarray(List<int> nums) {
    int left =0;
    int current =0;
    int maxlen =0;
    for(int right =0;right<nums.length;right++){
        while((current & nums[right])!=0){
            current ^= nums[left];
            left ++;
        }
        current |= nums[right];
        maxlen = maxlen > (right - left +1) ? maxlen : (right - left +1);
    }
    return maxlen;
      }
      
}
