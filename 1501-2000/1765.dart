import 'dart:collection';

class Solution {
  List<List<int>> highestPeak(List<List<int>> isWater) {
    int m = isWater.length;
    int n = isWater[0].length;
    
    List<List<int>> height = List.generate(m, (_) => List.filled(n, -1));
    Queue<List<int>> queue = Queue();

    // Initialize the queue with all water cells and set their height to 0
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (isWater[i][j] == 1) {
          queue.add([i, j]);
          height[i][j] = 0;
        }
      }
    }

    // Direction vectors for 4-way movement
    List<List<int>> directions = [
      [0, 1], [1, 0], [0, -1], [-1, 0]
    ];

    // Perform BFS to fill heights
    while (queue.isNotEmpty) {
      List<int> cell = queue.removeFirst();
      int r = cell[0], c = cell[1];

      for (List<int> dir in directions) {
        int nr = r + dir[0];
        int nc = c + dir[1];

        if (nr >= 0 && nr < m && nc >= 0 && nc < n && height[nr][nc] == -1) {
          height[nr][nc] = height[r][c] + 1;
          queue.add([nr, nc]);
        }
      }
    }

    return height;
  }
}
