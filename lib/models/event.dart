class Event {
  final String id;
  final String title;
  final String date;
  final String location;
  final String organizer;
  final bool isRegistered;
  final String? imageUrl;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.location,
    required this.organizer,
    this.isRegistered = false,
    this.imageUrl,
  });
}
