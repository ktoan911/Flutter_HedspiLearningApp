class ResultData {
  late final String subjectName;
  late final double totalScore;

  ResultData(this.subjectName, this.totalScore);
}

List<ResultData> resultList = [
  ResultData('C Basic', 9.8),
  ResultData('C Intro', 5),
  ResultData('C Basic', 9.8),
  ResultData('C Basic', 9.8),
  ResultData('C Basic', 2),
  ResultData('C Basic', 2),
  ResultData('C Basic', 2),
  ResultData('C Basic', 2),
];

double SumScore(List<ResultData> resultList) {
  double sumMark = resultList.map((e) => e.totalScore).fold(0, (a, b) => a + b);
  sumMark = double.parse(sumMark.toStringAsFixed(2));
  return sumMark;
}
