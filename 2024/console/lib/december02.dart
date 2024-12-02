int checkIfSafe(List<List<int>> input) {
  var countSafe = 0;
  for (final report in input) {
    var increasing = false;
    var decresing = false;
    var safe = true;
    for (var i = 0; i < report.length - 1; i++) {
      if (report[i + 1] > report[i]) {
        increasing = true;
      } else {
        decresing = true;
      }
      if ((report[i + 1] - report[i]).abs() < 1 ||
          (report[i + 1] - report[i]).abs() > 3) {
        safe = false;
      }
      if (increasing && decresing) {
        safe = false;
      }
    }
    if (safe) {
      countSafe++;
    }
  }
  return countSafe;
}
