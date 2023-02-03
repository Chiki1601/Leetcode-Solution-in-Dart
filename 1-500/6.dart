class Solution {
  String convert(String s, int numRows) {
    if (numRows == 1) return s;
    if (s.length <= numRows) return s;

    String result = '';
    List<String> charList = s.split('');
    int interval = numRows + numRows - 2;
    for (int i = 0; i < numRows; i++) {
      for (int j = i; j < charList.length; j += interval) {
        result += charList[j];
        if (i != 0 && i != numRows - 1 && j + interval - i * 2 < charList.length) {
          result += charList[j + interval - i * 2];
        }
      }
    }
    return result;
  }
}
