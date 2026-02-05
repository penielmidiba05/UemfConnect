enum NotificationType {
  event,
  reminder,
  general,
}

class AppNotification {
  final String message;
  final String time;
  final NotificationType type;

  const AppNotification({
    required this.message,
    required this.time,
    required this.type,
  });
}