class Solution {
    int waysToSplitArray(List<int> nums) {
        var c = 0;
        final pre = prefixSum(nums);
        for (int i = 0; i < pre.length; i++) {
            final cand = pre[i];
            final res = validSplits(i, cand, pre.last, pre.length, c);
            c = res;
        }
        return c;
    }

    List<int> prefixSum(List<int> nums) {
        final prefix = List.filled(nums.length, 0);
        prefix.first = nums.first;
        for (int i = 1; i < nums.length; i++) {
            prefix[i] = prefix[i - 1] + nums[i];
        }

        return prefix;
    }

    int validSplits(int index, int cand, int last, int size, int count) {
        final diff = last - cand;
        if (cand >= diff && index < size - 1) {
            count += 1;
            return count;
        }

        return count;
    }
}
