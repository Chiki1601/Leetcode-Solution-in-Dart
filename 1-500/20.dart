
class Solution {
  bool isValid(String s) {
    final open1 = "(".codeUnitAt(0);
    final open2 = "{".codeUnitAt(0);
    final open3 = "[".codeUnitAt(0);
    final close1 = ")".codeUnitAt(0);
    final close2 = "}".codeUnitAt(0);
    final close3 = "]".codeUnitAt(0);

    List<int> stack = [];
    for (var element in s.codeUnits) {
      if (element == open1 || element == open2 || element == open3) {
        stack.add(element);
      } else if (element == close1) {
        if (stack.isEmpty || stack.removeLast() != open1) {
          return false;
        }
      } else if (element == close2) {
        if (stack.isEmpty || stack.removeLast() != open2) {
          return false;
        }
      } else if (element == close3) {
        if (stack.isEmpty || stack.removeLast() != open3) {
          return false;
        }
      }
    }
    return stack.isEmpty;
  }
}
