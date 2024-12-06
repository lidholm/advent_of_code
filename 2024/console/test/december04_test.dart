import 'package:console/december04.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  test('findXmas with small example data', () {
    final input = '''
..X...
.SAMX.
.A..A.
XMAS.S
.X....
''';
    final solver = Dec04();
    expect(solver.findXmas(input), 4);
  });

  test('findXmas with larger example data', () {
    final input = '''
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
''';
    final solver = Dec04();
    expect(solver.findXmas(input), 18);
  });

  test('findXmas with input data', () async {
    final input = await getInputData();
    final solver = Dec04();
    expect(solver.findXmas(input), 2462);
  });

  test('findXofMAS with small example data', () {
    final input = '''
M.S
.A.
M.S
''';
    final solver = Dec04();
    expect(solver.findXofMAS(input), 1);
  });

  test('findXofMAS with larger example data', () {
    final input = '''
.M.S......
..A..MSMS.
.M.S.MAA..
..A.ASMSM.
.M.S.M....
..........
S.S.S.S.S.
.A.A.A.A..
M.M.M.M.M.
..........
''';
    final solver = Dec04();
    expect(solver.findXofMAS(input), 9);
  });

  test('findXofMAS with input data', () async {
    final input = await getInputData();
    final solver = Dec04();
    expect(solver.findXofMAS(input), 1877);
  });

  test('checkXoption1', () {
    final input = '''
M.S
.A.
M.S
''';
    final solver = Dec04();
    expect(solver.findXofMAS(input), 1);
  });

  test('checkXoption2', () {
    final input = '''
S.S
.A.
M.M
''';
    final solver = Dec04();
    expect(solver.findXofMAS(input), 1);
  });

  test('checkXoption3', () {
    final input = '''
S.M
.A.
S.M
''';
    final solver = Dec04();
    expect(solver.findXofMAS(input), 1);
  });

  test('checkXoption4', () {
    final input = '''
M.M
.A.
S.S
''';
    final solver = Dec04();
    expect(solver.findXofMAS(input), 1);
  });
}

Future<String> getInputData() async {
  final filePath = '../puzzleInputs/december04-part1-input.txt';

  final file = File(filePath);
  final contents = await file.readAsString();
  return contents;
}
