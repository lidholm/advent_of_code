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

int checkIfSafeWithDampener(List<List<int>> input) {
  var countSafe = 0;
  for (final report in input) {
    for (var j = 0; j < report.length; j++) {
      final dampenedReport = report.take(10000000).toList();
      dampenedReport.removeAt(j);

      var increasing = false;
      var decresing = false;
      var safe = true;
      for (var i = 0; i < dampenedReport.length - 1; i++) {
        if (dampenedReport[i + 1] > dampenedReport[i]) {
          increasing = true;
        } else {
          decresing = true;
        }
        if ((dampenedReport[i + 1] - dampenedReport[i]).abs() < 1 ||
            (dampenedReport[i + 1] - dampenedReport[i]).abs() > 3) {
          safe = false;
        }
        if (increasing && decresing) {
          safe = false;
        }
      }
      if (safe) {
        countSafe++;
        break;
      }
    }
  }

  return countSafe;
}
