import 'dart:collection';

class Dec04 {
  final positionsForX = <(int, int), bool>{};
  final positionsForM = <(int, int), bool>{};
  final positionsForA = <(int, int), bool>{};
  final positionsForS = <(int, int), bool>{};

  int findXmas(String input) {
    findAllPositions(input);

    var count = 0;

    for (final xpos in positionsForX.keys) {
      if (checkRight(xpos)) {
        count++;
      }
    }

    return count;
  }

  void findAllPositions(String input) {
    var lines = input.split(('\n'));

    for (var r = 0; r < lines.length; r++) {
      for (var c = 0; c < lines[r].length; c++) {
        print('$r, $c, ${lines[r][c]}');
        switch (lines[r][c]) {
          case 'X':
            positionsForX[(r, c)] = true;
            break;
          case 'M':
            positionsForM[(r, c)] = true;
            break;
          case 'A':
            positionsForA[(r, c)] = true;
            break;
          case 'S':
            positionsForS[(r, c)] = true;
            break;
        }
      }
    }
  }

  bool checkRight((int, int) xPos) {
    final xInc = 1;
    final yInc = 0;

    final posCheckers = [
      positionsForM,
      positionsForA,
      positionsForS,
    ];

    for (final (i, posChecker) in posCheckers.indexed) {
      final key = (xPos.$1 + yInc * (i + 1), xPos.$2 + xInc * (i + 1));
      if (posChecker.containsKey(key)) {
        return true;
      }
    }

    return false;
  }
}
