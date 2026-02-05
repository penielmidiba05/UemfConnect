import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/event_provider.dart';
import '../models/event.dart';
import '../widgets/event_card.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    final List<Event> events = eventProvider.events;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Campus Events'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 🔹 Header premium
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0D47A1), Color(0xFF42A5F5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Bienvenue à UEMF Connect 👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Explorez les conférences, événements et activités étudiantes du campus',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Liste événements
          Expanded(
            child: events.isEmpty
                ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.event_busy,
                      size: 80, color: Colors.grey),
                  SizedBox(height: 15),
                  Text(
                    'Aucun événement disponible pour le moment',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.only(top: 12),
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventCard(
                  event: events[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/eventDetails',
                      arguments: events[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
