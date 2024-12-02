import 'package:console/december02.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  test('checkIfSafe with example data', () {
    final input = [
      [7, 6, 4, 2, 1],
      [1, 2, 7, 8, 9],
      [9, 7, 6, 2, 1],
      [1, 3, 2, 4, 5],
      [8, 6, 4, 4, 1],
      [1, 3, 6, 7, 9],
    ];
    expect(checkIfSafe(input), 2);
  });

  test('checkIfSafe with input data', () async {
    final input = await getListsFromInputData();
    expect(checkIfSafe(input), 516);
  });
}

Future<List<List<int>>> getListsFromInputData() async {
  final filePath = './test/december02-part1-input.txt';

  final file = File(filePath);
  final contents = await file.readAsString();
  final lines = contents.split('\n');
  List<List<int>> input = [];
  for (var line in lines) {
    line = line.trim();
    if (line.isEmpty) continue;
    final parts = line.split(RegExp(r'\s+'));
    input.add(parts.map((i) => int.parse(i)).toList());
  }
  return input;
}
