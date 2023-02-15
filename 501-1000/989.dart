class Solution {
  List<int> addToArrayForm(List<int> num, int k) {
    final ks = k.toString().split('').map((number) => int.parse(number)).toList();
    List<int> max = ks.reversed.toList();
    List<int> min = num.reversed.toList();
    if(ks.length<num.length){
        max = num.reversed.toList();
        min = ks.reversed.toList();
    }
    for( var i = 0 ; i < min.length; i++) { 
        int sum = max[i] + min[i];
         if(sum < 10) {
             max[i] = sum;
         } else {
            max[i] = (sum)-10;
            if(i+1 >= min.length){
                min.add(1);
                if(min.length > max.length){
                    max.add(0);
                }
            } else {
                min[i+1] = min[i+1] + 1;
            }
         }
    }
    return max.reversed.toList();
  }
}
