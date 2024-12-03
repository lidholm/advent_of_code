int calculateMuls(String input) {
  final pattern = "mul\\(\\d{1,3},\\d{1,3}\\)";
  final regExp = RegExp(pattern);

  final matches = regExp.allMatches(input);

  List<int> positions = matches.map((match) => match.start).toList();
  // print("Occurrences found at positions: $positions");

  var sum = 0;
  for (final pos in positions) {
    final end = input.substring(pos).indexOf(')');
    final mul = (input.substring(pos + 4, pos + end)).split(',');
    sum += int.parse(mul[0]) * int.parse(mul[1]);
  }

  return sum;
}

int calculateMulDos(String input) {
  final patternMul = "mul\\(\\d{1,3},\\d{1,3}\\)";
  final regExpMul = RegExp(patternMul);

  final matches = regExpMul.allMatches(input);
  List<int> positionsMuls = matches.map((match) => match.start).toList();

  final allDosMatches = RegExp('do\\(\\)').allMatches(input);
  List<int> positionsDos = allDosMatches.map((match) => match.start).toList();
  print(positionsDos);

  final allDontsMatches = RegExp("don't\\(\\)").allMatches(input);
  List<int> positionsDonts =
      allDontsMatches.map((match) => match.start).toList();
  print(positionsDonts);

  var allowedIndices = [];
  var allowed = true;
  for (var i = 0; i < input.length; i++) {
    if (positionsDos.contains(i)) {
      allowed = true;
    }
    if (positionsDonts.contains(i)) {
      allowed = false;
    }
    if (allowed) {
      allowedIndices.add(i);
    }
  }
  print(allowedIndices);

  var sum = 0;
  for (final pos in positionsMuls) {
    final end = input.substring(pos).indexOf(')');
    final mul = (input.substring(pos + 4, pos + end)).split(',');
    if (allowedIndices.contains(pos + 4)) {
      sum += int.parse(mul[0]) * int.parse(mul[1]);
    }
  }

  return sum;
}
