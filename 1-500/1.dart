class Solution {
    List<int> twoSum(List<int> nums, int target) {
      List<int> answer = [];
      for(int i = 0; i< nums.length; i++){
         for(int j = i+1; j< nums.length; j++){
             if((nums[i]+nums[j]) == target){
                 answer.add(i);
                 answer.add(j);
             }
         }
      }
      return answer;
  }
}
}
