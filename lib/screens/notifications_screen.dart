import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/notification_tile.dart';
import '../models/app_notification.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  final List<AppNotification> notifications = const [
    AppNotification(
      message: 'Nouvelle conférence IA ce vendredi',
      time: 'Il y a 10 min',
      type: NotificationType.event,
    ),
    AppNotification(
      message: 'Rappel : Match de basket à 18h',
      time: 'Il y a 1 heure',
      type: NotificationType.reminder,
    ),
    AppNotification(
      message: 'Réunion du club programmation',
      time: 'Hier',
      type: NotificationType.general,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 🔹 Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Centre de notifications 🔔',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Restez informé des dernières activités',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          Expanded(
            child: notifications.isEmpty
                ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off,
                    size: 70,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Aucune notification',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return NotificationTile(
                  notification: notifications[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
