// ignore_for_file: non_constant_identifier_names

class ResultData {
  late String subjectName;
  late double totalScore;
  late int numbercredit;

  ResultData(this.subjectName, this.totalScore, this.numbercredit);
}

List<ResultData> resultList = [];

int NumberCredit(List<ResultData> resultList) {
  int sumCredit =
      resultList.map((e) => e.numbercredit).fold(0, (a, b) => a + b);
  return sumCredit;
}

double SumScore(List<ResultData> resultList) {
  double sumMark = 0;
  for (int i = 0; i < resultList.length; i++) {
    sumMark +=
        ConvertTo4(resultList[i].totalScore) * resultList[i].numbercredit;
  }
  sumMark = sumMark / NumberCredit(resultList).toDouble();
  sumMark = double.parse(sumMark.toStringAsFixed(2));
  return sumMark;
}

double ConvertTo4(double score) {
  if (score >= 8.5) {
    return 4.0;
  } else if (score >= 8.0) {
    return 3.5;
  } else if (score >= 7.0) {
    return 3.0;
  } else if (score >= 6.5) {
    return 2.5;
  } else if (score >= 5.5) {
    return 2.0;
  } else if (score >= 5.0) {
    return 1.5;
  } else if (score >= 4.0) {
    return 1;
  } else {
    return 0.0;
  }
}
