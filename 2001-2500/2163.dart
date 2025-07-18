class Solution {
  int minimumDifference(List<int> nums) {
    int N = nums.length;
    int n = N ~/ 3;

    List<int> leftSum = List.filled(N + 1, 0);
    Heap<int> maxHeap = Heap<int>((a, b) => a > b);
    int sumL = 0;

    for (int i = 0; i < n; i++) {
      sumL += nums[i];
      maxHeap.push(nums[i]);
    }
    leftSum[n] = sumL;

    for (int i = n; i < 2 * n; i++) {
      sumL += nums[i];
      maxHeap.push(nums[i]);

      if (maxHeap.count > n) {
        var x = maxHeap.pop();
        if (x != null) sumL -= x;
      }
      leftSum[i + 1] = sumL;
    }

    List<int> rightSum = List.filled(N + 1, 0);
    Heap<int> minHeap = Heap<int>((a, b) => a < b);
    int sumR = 0;

    for (int i = N - 1; i >= 2 * n; i--) {
      sumR += nums[i];
      minHeap.push(nums[i]);
    }
    rightSum[2 * n] = sumR;

    for (int i = 2 * n - 1; i >= n; i--) {
      sumR += nums[i];
      minHeap.push(nums[i]);

      if (minHeap.count > n) {
        var x = minHeap.pop();
        if (x != null) sumR -= x;
      }
      rightSum[i] = sumR;
    }

    int ans = 1 << 60; // a large number simulating Int.max

    for (int k = n; k <= 2 * n; k++) {
      ans = ans < (leftSum[k] - rightSum[k]) ? ans : (leftSum[k] - rightSum[k]);
    }

    return ans;
  }
}

class Heap<T> {
  List<T> data = [];
  final bool Function(T, T) areSorted;

  Heap(this.areSorted);

  int get count => data.length;

  void push(T val) {
    data.add(val);
    _siftUp(data.length - 1);
  }

  T? pop() {
    if (data.isEmpty) return null;
    _swap(0, data.length - 1);
    T val = data.removeLast();
    _siftDown(0);
    return val;
  }

  void _siftUp(int index) {
    int child = index;
    int parent = (child - 1) ~/ 2;

    while (child > 0 && !areSorted(data[parent], data[child])) {
      _swap(parent, child);
      child = parent;
      parent = (child - 1) ~/ 2;
    }
  }

  void _siftDown(int index) {
    int parent = index;

    while (true) {
      int left = 2 * parent + 1;
      int right = left + 1;
      int candidate = parent;

      if (left < data.length && !areSorted(data[candidate], data[left])) {
        candidate = left;
      }

      if (right < data.length && !areSorted(data[candidate], data[right])) {
        candidate = right;
      }

      if (candidate == parent) break;

      _swap(parent, candidate);
      parent = candidate;
    }
  }

  void _swap(int i, int j) {
    final temp = data[i];
    data[i] = data[j];
    data[j] = temp;
  }
}
