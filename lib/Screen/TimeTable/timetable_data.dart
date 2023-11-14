class TimeTable {
  final String subject;
  final String room;
  final int date;
  final String time;

  TimeTable({
    required this.subject,
    required this.room,
    required this.date,
    required this.time,
  });
}

List<TimeTable> timeTable = [
  TimeTable(
      subject: "Computer Science",
      room: 'D5 104',
      date: 12,
      time: '7:30 - 9:30'),
  TimeTable(
      subject: "Computer Science",
      room: 'D5 104',
      date: 13,
      time: '7:30 - 9:30'),
  TimeTable(
      subject: "Computer Science",
      room: 'D5 104',
      date: 14,
      time: '7:30 - 9:30'),
  TimeTable(
      subject: "Computer Science",
      room: 'D5 104',
      date: 14,
      time: '7:30 - 9:30'),
  TimeTable(
      subject: "Computer Science",
      room: 'D5 104',
      date: 16,
      time: '7:30 - 9:30'),
  TimeTable(
      subject: "Computer Science",
      room: 'D5 104',
      date: 4,
      time: '7:30 - 9:30'),
];
