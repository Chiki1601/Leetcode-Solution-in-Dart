class Solution {
  int minTimeToReach(List<List<int>> moveTime) {
    final int n = moveTime.length;
    final int m = moveTime[0].length;

    // Initialize best time grid with a large number
    List<List<int>> best = List.generate(n, (_) => List.filled(m, 1 << 30));
    best[0][0] = 0;

    List<List<int>> dirs = [
      [-1, 0], // Up
      [1, 0],  // Down
      [0, -1], // Left
      [0, 1],  // Right
    ];

    void dfs(int x, int y, int currentTime) {
      if (x == n - 1 && y == m - 1) return; // Reached goal

      for (var dir in dirs) {
        int nx = x + dir[0];
        int ny = y + dir[1];

        if (nx >= 0 && nx < n && ny >= 0 && ny < m) {
          int wait = moveTime[nx][ny] - currentTime;
          int timeNeeded = currentTime + 1 + (wait > 0 ? wait : 0);
          if (timeNeeded < best[nx][ny]) {
            best[nx][ny] = timeNeeded;
            dfs(nx, ny, timeNeeded);
          }
        }
      }
    }

    dfs(0, 0, 0);
    return best[n - 1][m - 1];
  }
}
