class Solution {
  int minimumRecolors(String blocks, int k) {
    int whiteCount = 0;
    int left = 0;
    int result = k;

    for (int right = 0; right < blocks.length; right++) {
      if (blocks[right] == 'W') whiteCount++;
      if (right - left == k - 1) {
        result = result < whiteCount ? result : whiteCount;
      }
      if (right - left >= k - 1) {
        if (blocks[left] == 'W') {
          whiteCount--;
        }
        left++;
      }
    }
    return result;
  }
}
