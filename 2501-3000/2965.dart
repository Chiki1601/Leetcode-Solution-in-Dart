class Solution {
  List<int> findMissingAndRepeatedValues(List<List<int>> grid) {
  List<int> result = [0, 0];
  List<int> allNumbers = [];

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      allNumbers.add(grid[i][j]);
    }
  }
  allNumbers.sort();
  for (int i = 0; i < allNumbers.length - 1; i++) {
    if (allNumbers[i] == allNumbers[i + 1]) {
      result[0] = allNumbers[i];
    } else if (allNumbers[i + 1] - allNumbers[i] > 1) {
      result[1] = allNumbers[i] + 1;
    } else if (result[1] == 0) {
     result[1] = (allNumbers.first) == 2 ? 1 : (allNumbers.last) + 1;
    }
  }

  return result;
}
}
