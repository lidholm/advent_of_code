import 'dart:collection';

class Dec04 {
  final positionsForX = <(int, int), bool>{};
  final positionsForM = <(int, int), bool>{};
  final positionsForA = <(int, int), bool>{};
  final positionsForS = <(int, int), bool>{};

  int findXmas(String input) {
    findAllPositions(input);

    var count = 0;

    final checkers = [
      checkRight,
      checkLeft,
      checkUp,
      checkDown,
      checkUpLeft,
      checkUpRight,
      checkDownLeft,
      checkDownRight,
    ];
    for (final xpos in positionsForX.keys) {
      for (final checker in checkers) {
        if (checker(xpos)) {
          count++;
        }
      }
    }

    return count;
  }

  void findAllPositions(String input) {
    var lines = input.split(('\n'));

    for (var r = 0; r < lines.length; r++) {
      for (var c = 0; c < lines[r].length; c++) {
        // print('$r, $c, ${lines[r][c]}');
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
    return check(xPos, 1, 0);
  }

  bool checkLeft((int, int) xPos) {
    return check(xPos, -1, 0);
  }

  bool checkUp((int, int) xPos) {
    return check(xPos, 0, -1);
  }

  bool checkDown((int, int) xPos) {
    return check(xPos, 0, 1);
  }

  bool checkUpLeft((int, int) xPos) {
    return check(xPos, -1, -1);
  }

  bool checkUpRight((int, int) xPos) {
    return check(xPos, 1, -1);
  }

  bool checkDownLeft((int, int) xPos) {
    return check(xPos, -1, 1);
  }

  bool checkDownRight((int, int) xPos) {
    return check(xPos, 1, 1);
  }

  bool check((int, int) xPos, int xInc, int yInc) {
    final posCheckers = [
      positionsForX,
      positionsForM,
      positionsForA,
      positionsForS,
    ];

    for (final (i, posChecker) in posCheckers.indexed) {
      final key = (xPos.$1 + yInc * (i), xPos.$2 + xInc * (i));
      if (!posChecker.containsKey(key)) {
        return false;
      }
    }

    return true;
  }

  int findXofMAS(String input) {
    findAllPositions(input);

    var count = 0;

    final checkers = [
      checkXoption1,
      checkXoption2,
      checkXoption3,
      checkXoption4,
    ];
    for (final xpos in positionsForA.keys) {
      if (checkers.any((checker) => checker(xpos))) {
        count++;
      }
    }

    return count;
  }

  bool checkXoption1((int, int) pos) {
    if (positionsForM.containsKey((pos.$1 - 1, pos.$2 - 1)) &&
        positionsForS.containsKey((pos.$1 + 1, pos.$2 + 1)) &&
        positionsForM.containsKey((pos.$1 + 1, pos.$2 - 1)) &&
        positionsForS.containsKey((pos.$1 - 1, pos.$2 + 1))) {
      return true;
    }

    return false;
  }

  bool checkXoption2((int, int) pos) {
    if (positionsForM.containsKey((pos.$1 + 1, pos.$2 + 1)) &&
        positionsForS.containsKey((pos.$1 - 1, pos.$2 - 1)) &&
        positionsForM.containsKey((pos.$1 + 1, pos.$2 - 1)) &&
        positionsForS.containsKey((pos.$1 - 1, pos.$2 + 1))) {
      return true;
    }

    return false;
  }

  bool checkXoption3((int, int) pos) {
    if (positionsForM.containsKey((pos.$1 - 1, pos.$2 + 1)) &&
        positionsForS.containsKey((pos.$1 - 1, pos.$2 - 1)) &&
        positionsForM.containsKey((pos.$1 + 1, pos.$2 + 1)) &&
        positionsForS.containsKey((pos.$1 + 1, pos.$2 - 1))) {
      return true;
    }

    return false;
  }

  bool checkXoption4((int, int) pos) {
    if (positionsForM.containsKey((pos.$1 - 1, pos.$2 - 1)) &&
        positionsForM.containsKey((pos.$1 - 1, pos.$2 + 1)) &&
        positionsForS.containsKey((pos.$1 + 1, pos.$2 - 1)) &&
        positionsForS.containsKey((pos.$1 + 1, pos.$2 + 1))) {
      return true;
    }

    return false;
  }
}
