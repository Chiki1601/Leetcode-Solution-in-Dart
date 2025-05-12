class Solution {
  List<int> findEvenNumbers(List<int> digits) {
  final count = List.filled(10, 0);
  for (var digit in digits) count[digit]++;
  
  final result = <int>[];
  for (int num = 100; num < 1000; num += 2) {
    final hundreds = num ~/ 100;
    final tens = (num ~/ 10) % 10;
    final ones = num % 10;
    
    final tempCount = List.of(count);
    tempCount[hundreds]--;
    tempCount[tens]--;
    tempCount[ones]--;
    
    if (tempCount.every((c) => c >= 0)) {
      result.add(num);
    }
  }
  return result;
}

}
