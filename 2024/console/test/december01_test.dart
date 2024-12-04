import 'package:console/december01.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  test('findDistance with example data', () {
    final listA = [3, 4, 2, 1, 3, 3];
    final listB = [4, 3, 5, 3, 9, 3];
    expect(findDistance(listA, listB), 11);
  });

  test('findDistance with input data', () async {
    final (listA, listB) = await getListsFromInputData();
    expect(findDistance(listA, listB), 1941353);
  });

  test('findSimilarityScore with example data', () {
    final listA = [3, 4, 2, 1, 3, 3];
    final listB = [4, 3, 5, 3, 9, 3];
    expect(findSimilarityScore(listA, listB), 31);
  });

  test('findSimilarityScore with input data', () async {
    final (listA, listB) = await getListsFromInputData();
    expect(findSimilarityScore(listA, listB), 22539317);
  });
}

Future<(List<int>, List<int>)> getListsFromInputData() async {
  final filePath = '../puzzleInputs/december01-part1-input.txt';

  final file = File(filePath);
  final contents = await file.readAsString();
  final lines = contents.split('\n');
  List<int> listA = [];
  List<int> listB = [];
  for (var line in lines) {
    line = line.trim();
    if (line.isEmpty) continue;
    final parts = line.split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      listA.add(int.parse(parts[0]));
      listB.add(int.parse(parts[1]));
    }
  }
  return (listA, listB);
}
