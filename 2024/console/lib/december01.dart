int findDistance(List<int> listA, List<int> listB) {
  listA.sort();
  listB.sort();
  var totalDistance = 0;
  for (final i in List.generate(listA.length, (i) => i)) {
    totalDistance += (listA[i] - listB[i]).abs();
  }
  return totalDistance;
}

int findSimilarityScore(List<int> listA, List<int> listB) {
  final dictB = <int, int>{};
  for (final i in listB) {
    if (!dictB.containsKey(i)) {
      dictB[i] = 0;
    }
    dictB[i] = dictB[i]! + 1;
  }
  var similarityScore = 0;
  for (final i in listA) {
    final occurences = dictB[i] ?? 0;
    similarityScore += i * occurences;
  }
  return similarityScore;
}
