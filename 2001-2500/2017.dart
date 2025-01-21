class Solution {
  int gridGame(List<List<int>> grid) {
    int n = grid[0].length;

    // Prefix sum arrays to calculate the sum of points efficiently
    List<int> topPrefix = List.filled(n + 1, 0);
    List<int> bottomPrefix = List.filled(n + 1, 0);

    for (int i = 0; i < n; i++) {
      topPrefix[i + 1] = topPrefix[i] + grid[0][i];
      bottomPrefix[i + 1] = bottomPrefix[i] + grid[1][i];
    }

    int result = double.maxFinite.toInt();

    for (int i = 0; i < n; i++) {
      int topRemaining = topPrefix[n] - topPrefix[i + 1]; // Points left on top after the first robot
      int bottomCollected = bottomPrefix[i]; // Points collected on bottom before this column

      int secondRobotMax = max(topRemaining, bottomCollected);
      result = min(result, secondRobotMax);
    }

    return result;
  }
}
