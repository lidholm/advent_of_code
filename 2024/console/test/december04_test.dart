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
}

Future<String> getInputData() async {
  final filePath = '../puzzleInputs/december04-part1-input.txt';

  final file = File(filePath);
  final contents = await file.readAsString();
  return contents;
}
