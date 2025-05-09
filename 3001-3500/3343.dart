class Solution {
  static const int mod = 1000000007;
  late List<int> fact, inv, invFact;

  void precompute(int n) {
    fact = List.filled(n + 1, 0);
    inv = List.filled(n + 1, 0);
    invFact = List.filled(n + 1, 0);

    fact[0] = inv[0] = invFact[0] = 1;

    for (int i = 1; i <= n; i++) {
      fact[i] = (fact[i - 1] * i) % mod;
    }

    inv[1] = 1;
    for (int i = 2; i <= n; i++) {
      inv[i] = mod - (mod ~/ i) * inv[mod % i] % mod;
    }

    for (int i = 1; i <= n; i++) {
      invFact[i] = (invFact[i - 1] * inv[i]) % mod;
    }
  }

  int countBalancedPermutations(String num) {
    int n = num.length;
    int sum = num.codeUnits.fold(0, (prev, c) => prev + (c - '0'.codeUnitAt(0)));

    if (sum % 2 == 1) return 0;

    precompute(n);

    int halfSum = sum ~/ 2;
    int halfLen = n ~/ 2;

    List<List<int>> dp = List.generate(halfSum + 1, (_) => List.filled(halfLen + 1, 0));
    dp[0][0] = 1;

    List<int> digits = List.filled(10, 0);

    for (int i = 0; i < n; i++) {
      int d = num.codeUnitAt(i) - '0'.codeUnitAt(0);
      digits[d]++;
      for (int s = halfSum; s >= d; s--) {
        for (int l = halfLen; l > 0; l--) {
          dp[s][l] = (dp[s][l] + dp[s - d][l - 1]) % mod;
        }
      }
    }

    int res = dp[halfSum][halfLen];
    res = (((res * fact[halfLen]) % mod) * fact[n - halfLen]) % mod;

    for (int cnt in digits) {
      res = (res * invFact[cnt]) % mod;
    }

    return res;
  }
}
