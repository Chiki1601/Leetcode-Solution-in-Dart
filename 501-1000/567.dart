class Solution {
  bool checkInclusion(String s1, String s2) {
     if (s1.length > s2.length) {
      return false;
    }

    List<int> s1map = List<int>.filled(26, 0, growable: false);
    List<int> s2map = List<int>.filled(26, 0, growable: false);

    for (var i = 0; i < s1.length; i++) {
      s1map[s1.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
      s2map[s2.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }
    for (var i = 0; i < (s2.length - s1.length); i++) {
      if (matches(s1map, s2map)) {
        return true;
      }

      s2map[s2.codeUnitAt(i + s1.length) - 'a'.codeUnitAt(0)]++;
      s2map[s2.codeUnitAt(i) - 'a'.codeUnitAt(0)]--;
    }

    return matches(s1map, s2map);
  }

  bool matches(List<int> s1map, List<int> s2map) {
    for (int i = 0; i < 26; i++) {
      if (s1map[i] != s2map[i]) {
        return false;
      }
    }
    return true;
  }
}
