const int MOD = 1000000007;

class Solution {
  int lengthAfterTransformations(String s, int t, List<int> nums) {
    List<List<int>> T = getTransformationMatrix(nums);
    List<List<int>> poweredT = matrixPow(T, t);
    List<int> count = List.filled(26, 0);
    List<int> lengths = List.filled(26, 0);

    for (var c in s.runes) {
      count[c - 'a'.codeUnitAt(0)]++;
    }

    for (int i = 0; i < 26; i++) {
      for (int j = 0; j < 26; j++) {
        lengths[j] = (lengths[j] + count[i] * poweredT[i][j]) % MOD;
      }
    }

    int total = 0;
    for (int len in lengths) {
      total = (total + len) % MOD;
    }

    return total;
  }

  List<List<int>> getTransformationMatrix(List<int> nums) {
    List<List<int>> T = List.generate(26, (_) => List.filled(26, 0));
    for (int i = 0; i < nums.length; i++) {
      for (int step = 1; step <= nums[i]; step++) {
        T[i][(i + step) % 26]++;
      }
    }
    return T;
  }

  List<List<int>> getIdentityMatrix(int size) {
    List<List<int>> I = List.generate(size, (_) => List.filled(size, 0));
    for (int i = 0; i < size; i++) {
      I[i][i] = 1;
    }
    return I;
  }

  List<List<int>> matrixMult(List<List<int>> A, List<List<int>> B) {
    int size = A.length;
    List<List<int>> C = List.generate(size, (_) => List.filled(size, 0));
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        for (int k = 0; k < size; k++) {
          C[i][j] = (C[i][j] + A[i][k] * B[k][j]) % MOD;
        }
      }
    }
    return C;
  }

  List<List<int>> matrixPow(List<List<int>> M, int n) {
    if (n == 0) return getIdentityMatrix(M.length);
    if (n % 2 == 1) return matrixMult(M, matrixPow(M, n - 1));
    List<List<int>> half = matrixPow(M, n ~/ 2);
    return matrixMult(half, half);
  }
}
