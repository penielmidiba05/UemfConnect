import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/event_provider.dart';
import '../models/event.dart';
import '../widgets/event_card.dart';
import '../widgets/app_drawer.dart';

class MyEventsScreen extends StatelessWidget {
  const MyEventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    final List<Event> myEvents = eventProvider.myEvents;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Mes événements'),
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
                colors: [Color(0xFF2E7D32), Color(0xFF66BB6A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Événements inscrits 🎟️',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Retrouvez ici tous les événements auxquels vous participez',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          Expanded(
            child: myEvents.isEmpty
                ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_note,
                    size: 70,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Aucun événement inscrit pour le moment',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: myEvents.length,
              itemBuilder: (context, index) {
                return EventCard(
                  event: myEvents[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/eventDetails',
                      arguments: myEvents[index],
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
