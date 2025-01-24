class Solution {
  List<int> eventualSafeNodes(List<List<int>> g) {
    final V = g.length;
    var memo = List.filled(V, 0);

    bool dfs(int idx) {
      if (memo[idx] != 0)
        return memo[idx] == 1;
      memo[idx] = -1;

      for (int next in g[idx]) {
        if (!dfs(next))
          return false;
      }

      memo[idx] = 1;
      return true;
    }

    final res = <int>[];
    for (int i = 0; i < V; i++)
      if (dfs(i))
        res.add(i);
    return res;
  }
}
