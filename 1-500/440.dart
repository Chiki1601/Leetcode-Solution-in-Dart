class Solution {
  int findKthNumber(int n, int k) {
    int curr = 1; // Start from number 1 (root of lexicographical tree)
    k -= 1;       // Decrement k since we start at 1 already

    while (k > 0) {
      // Calculate how many numbers lie between 'curr' and 'curr + 1' lexicographically
      int steps = _getSteps(n, curr, curr + 1);

      if (steps <= k) {
        // If the subtree has fewer or equal numbers than k,
        // move to the next sibling (curr + 1) and subtract those steps from k
        k -= steps;
        curr += 1;
      } else {
        // If the k-th number is within the subtree rooted at curr,
        // go one level deeper (curr * 10)
        k -= 1;
        curr *= 10;
      }
    }

    return curr;
  }

  // Helper function to compute how many numbers are between prefix n1 and n2
  // in the range [1, n] in lexicographical order
  int _getSteps(int n, int n1, int n2) {
    int steps = 0;

    while (n1 <= n) {
      // For each level, count how many numbers are between n1 and n2
      // Clamp n2 to (n + 1) to avoid going beyond the upper limit
      steps += (n2 <= n + 1 ? n2 : n + 1) - n1;

      // Move to the next level of the tree
      n1 *= 10;
      n2 *= 10;
    }

    return steps;
  }
}
