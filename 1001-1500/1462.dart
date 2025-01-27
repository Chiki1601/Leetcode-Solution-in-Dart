class Solution {
  List<bool> checkIfPrerequisite(int numCourses, List<List<int>> prerequisites, List<List<int>> queries) {
    List<List<bool>> reachable = List.generate(numCourses, (_) => List.filled(numCourses, false));
    for (var prereq in prerequisites) {
        reachable[prereq[0]][prereq[1]] = true;
    }
    for (int k = 0; k < numCourses; k++) {
        for (int i = 0; i < numCourses; i++) {
            for (int j = 0; j < numCourses; j++) {
                reachable[i][j] = reachable[i][j] || (reachable[i][k] && reachable[k][j]);
            }
        }
    }
    List<bool> answer = [];
    for (var query in queries) {
        answer.add(reachable[query[0]][query[1]]);
    }
    return answer;
    }
}
