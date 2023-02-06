class Solution {
  List<int> twoSum(List<int> nums, int target) {
      List<int> possitions = [];
        if(nums.length == 2){
            possitions.addAll([0,1]);
        
        }
       else{ for(int i =0;i<nums.length;i++){
            for(int j = i+1;j<nums.length;j++){
                if(nums[i]+nums[j]==target){
                     possitions.addAll([i,j]);
                                      
                }
            }
        }}
        return possitions;
  }
}
