class AssignmetData {
  late final String subjectName;
  late final String topicName;
  late final DateTime deadLine;
  late final String note;
  late final String id;
  bool isSubmitted;
  AssignmetData(this.subjectName, this.topicName, this.deadLine, this.note,
      this.isSubmitted, this.id);
}

List<AssignmetData> assignList = [];
