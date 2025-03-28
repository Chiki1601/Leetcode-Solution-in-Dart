import 'dart:collection';
import 'package:collection/collection.dart';

class Solution {
  List<int> maxPoints(List<List<int>> grid, List<int> queries) {
    int m = grid.length, n = grid[0].length;
    List<int> sortedQueries = List.from(queries)..sort();
    Map<int, int> queryResult = {};
    List<int> answer = List.filled(queries.length, 0);
    
    List<List<int>> directions = [[0, 1], [0, -1], [1, 0], [-1, 0]];
    PriorityQueue<List<int>> minHeap = PriorityQueue((a, b) => a[0] - b[0]);
    Set<String> visited = {};

    minHeap.add([grid[0][0], 0, 0]);
    visited.add("0,0");

    int points = 0;

    for (int query in sortedQueries) {
      while (minHeap.isNotEmpty && minHeap.first[0] < query) {
        var cell = minHeap.removeFirst();
        int  r = cell[1], c = cell[2];

        points++; // Increment count of visited valid cells

        for (var dir in directions) {
          int nr = r + dir[0], nc = c + dir[1];
          String key = "$nr,$nc";

          if (nr >= 0 && nr < m && nc >= 0 && nc < n && !visited.contains(key)) {
            visited.add(key);
            minHeap.add([grid[nr][nc], nr, nc]);
          }
        }
      }
      queryResult[query] = points;
    }

    for (int i = 0; i < queries.length; i++) {
      answer[i] = queryResult[queries[i]]!;
    }
    
    return answer;
  }
}

