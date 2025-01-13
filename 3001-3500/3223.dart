class Solution {
  int minimumLength(String s) {
    int res = 0;
    final a = 'a'.codeUnitAt(0);
    final arr = List.filled(26, 0);
    for (int i = 0; i < s.length; i++){
        arr[s.codeUnitAt(i) - a]++;
    }
    for (final cnt in arr){
        if (cnt == 0) continue;
        if (cnt % 2 == 0) res += 2;
        else res += 1;
    }
    return res;
  }
}
