class Event {
  final String date;
  final String location;
  final String name;
  final String club;
  final int participants;

  Event({
    required this.date,
    required this.location,
    required this.name,
    required this.club,
    required this.participants,
  });

  static String convertDate(DateTime dateTime) {
    return '${dateTime.day.toString()}/${dateTime.month.toString()}/${dateTime.year.toString()}, ${dateTime.hour.toString()}:${dateTime.minute.toString()}';
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      date: convertDate(DateTime.parse(json['date'])),
      location: json['location'] as String,
      name: json['name'] as String,
      club: json['club'] as String,
      participants: json['participants'] as int,
    );
  }
}
