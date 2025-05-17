class Solution {
  void sortColors(List<int> nums) {
    for(int i = 0 ;i< nums.length;i++){
        for(int j = i+1 ;j< nums.length;j++){
            if(nums[j] < nums[i]){
                int temp =nums[i];
                nums[i] = nums[j];
                nums[j] = temp;
            }
        }
    }
  }
}
