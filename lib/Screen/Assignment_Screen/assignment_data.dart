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
void sortAssignmentList() {
  assignList.sort((a, b) => a.deadLine.compareTo(b.deadLine));
}

int numberAssignmentUndo() {
  int count = 0;
  for (int i = 0; i < assignList.length; i++) {
    if (!assignList[i].isSubmitted) {
      count++;
    }
  }
  return count;
}
