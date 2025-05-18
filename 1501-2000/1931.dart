class Solution {
  int colorTheGrid(int m, int n) {
    const MOD = 1000000007;
    final states = <int>[];

    void dfs(int pos, int prev, int mask) {
      if (pos == m) {
        states.add(mask);
        return;
      }
      for (int c = 0; c < 3; c++) {
        if (c != prev) dfs(pos + 1, c, mask * 3 + c);
      }
    }

    dfs(0, -1, 0);
    int S = states.length;
    final compat = List.generate(S, (_) => <int>[]);

    for (int i = 0; i < S; i++) {
      for (int j = 0; j < S; j++) {
        int x = states[i], y = states[j];
        bool ok = true;
        for (int k = 0; k < m; k++) {
          if (x % 3 == y % 3) { ok = false; break; }
          x ~/= 3; y ~/= 3;
        }
        if (ok) compat[i].add(j);
      }
    }

    var dp = List.filled(S, 1), newDp = List.filled(S, 0);
    for (int t = 1; t < n; t++) {
      newDp = List.filled(S, 0);
      for (int i = 0; i < S; i++) {
        for (int j in compat[i]) {
          newDp[j] = (newDp[j] + dp[i]) % MOD;
        }
      }
      dp = newDp;
    }

    return dp.fold(0, (a, b) => (a + b) % MOD);
  }
}
