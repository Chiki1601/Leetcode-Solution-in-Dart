class Solution {
  int prefixCount(List<String> words, String pref) {
    int c=0;
    for(String word in words){
      if(word.startsWith(pref)){
        c++;

      }
    }
    return c;
  }
}
