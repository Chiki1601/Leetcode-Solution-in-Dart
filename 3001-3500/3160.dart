class Solution {
  List<int> queryResults(int limit, List<List<int>> queries) {
    final res = <int>[];
    final colorOfBall = <int, int>{};
    final ballsOfColor = <int, Set<int>>{};
    for (final q in queries){
        final ball = q[0];
        final color = q[1];
        final prevColor = colorOfBall[ball] ?? 0;
        if (prevColor > 0){
            ballsOfColor[prevColor]!.remove(ball);
            if (ballsOfColor[prevColor]!.isEmpty){
                ballsOfColor.remove(prevColor);
            }
        }
        colorOfBall[ball] = color;
        (ballsOfColor[color] ??= {}).add(ball);
        res.add(ballsOfColor.length);
    }
    return res;
  }
}
