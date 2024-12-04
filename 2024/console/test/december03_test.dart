import 'package:console/december03.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  test('calculateMuls with example data', () {
    final input =
        'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))';
    expect(calculateMuls(input), 161);
  });

  test('calculateMuls with input data', () async {
    final input = await getInputData();
    expect(calculateMuls(input), 162813399);
  });

  test('calculateMulDos with example data', () {
    final input =
        "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))";
    expect(calculateMulDos(input), 48);
  });

  test('calculateMulDos with example data', () async {
    final input = await getInputData();
    expect(calculateMulDos(input), 53783319);
  });
}

Future<String> getInputData() async {
  final filePath = './test/december03-part1-input.txt';

  final file = File(filePath);
  final contents = await file.readAsString();
  return contents;
}
