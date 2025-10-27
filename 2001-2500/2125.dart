class Solution {
    int numberOfBeams(List<String> bank) {
        int ans = 0;
        for(int i =0;i<bank.length;i++){
            if(bank[i].indexOf('1')!=-1){
                int count1 = countcheck(bank[i]);
                int count2 = 0;
                for(int j = i+1;j<bank.length;j++){
                    if(bank[j].indexOf('1')!=-1){
                        count2 = countcheck(bank[j]);
                        break;
                    }
                } 
                ans+=count1*count2;               
            }
        }
        return ans;
    }
    static int countcheck(String s){
        int count = 0;
        for(int j = 0;j<s.length;j++)
            if(s[j]=='1')
                count++;
        return count;
    }
}
