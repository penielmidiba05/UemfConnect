import 'package:flutter/material.dart';
import '../models/app_notification.dart';

class NotificationTile extends StatelessWidget {
  final AppNotification notification;

  const NotificationTile({
    Key? key,
    required this.notification,
  }) : super(key: key);

  IconData _getIcon() {
    switch (notification.type) {
      case NotificationType.event:
        return Icons.event;
      case NotificationType.reminder:
        return Icons.alarm;
      case NotificationType.general:
      default:
        return Icons.notifications;
    }
  }

  Color _getColor() {
    switch (notification.type) {
      case NotificationType.event:
        return Colors.blue;
      case NotificationType.reminder:
        return Colors.orange;
      case NotificationType.general:
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getColor().withOpacity(0.15),
          child: Icon(
            _getIcon(),
            color: _getColor(),
          ),
        ),
        title: Text(
          notification.message,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(notification.time),
      ),
    );
  }
}
