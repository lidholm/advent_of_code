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
}

Future<String> getInputData() async {
  final filePath = '../puzzleInputs/december03-part1-input.txt';

  final file = File(filePath);
  final contents = await file.readAsString();
  return contents;
}
