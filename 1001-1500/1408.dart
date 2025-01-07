class Solution {
  List<String> stringMatching(List<String> words) {
      Set<String> result = {};
      for(int i=0; i<words.length; i++){
          for(int j=0; j<words.length; j++){
              if(i!=j && words[i].contains(words[j])){
                  result.add(words[j]);
              }
          }
      }
      return result.toList();
  }
}
