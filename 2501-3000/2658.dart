import 'dart:math';
import 'dart:collection';
class Solution {
  final dir = [(0, 1), (0, -1), (1, 0), (-1, 0)];
  int findMaxFish(List<List<int>> grid) {
    int res = 0;
    for (int i = 0; i < grid.length; i++){
        for (int j = 0; j < grid[0].length; j++){
            if (grid[i][j] == 0) continue;
            res = max(res, bfs(grid, i, j));
        }
    }
    return res;
  }
  int bfs(List<List<int>> grid, int i, int j){
    final q = Queue<(int, int)>()..add((i, j));
    int res = 0;
    while (q.isNotEmpty){
        final (y, x) = q.removeFirst();
        res += grid[y][x];
        grid[y][x] = 0;
        for (final (dy, dx) in dir){
            final ny = y + dy, nx = x + dx;
            if (ny < 0 || ny >= grid.length) continue;
            if (nx < 0 || nx >= grid[0].length) continue;
            if (grid[ny][nx] == 0) continue;
            q.add((ny, nx));
        }
    }
    return res;
  }
}
