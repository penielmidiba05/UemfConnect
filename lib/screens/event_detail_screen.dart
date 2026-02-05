import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/event.dart';
import '../providers/event_provider.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Event event =
    ModalRoute.of(context)!.settings.arguments as Event;

    final eventProvider = Provider.of<EventProvider>(context);

    final bool isRegistered = eventProvider.myEvents.contains(event);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de l’événement'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Image dynamique
            Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    event.imageUrl ?? 'https://images.unsplash.com/photo-1503428593586-e225b39bddfe?fit=crop&w=800&q=80',
                  ),

                  fit: BoxFit.cover,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(event.date),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.redAccent),
                      const SizedBox(width: 8),
                      Text(event.location),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(Icons.person, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(event.organizer),
                    ],
                  ),
                  const SizedBox(height: 30),

                  const Text(
                    'À propos de l’événement',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  const Text(
                    'Cet événement est organisé dans le cadre des activités universitaires et vise à renforcer l’engagement des étudiants, le partage de connaissances et le networking.',
                    style: TextStyle(height: 1.5),
                  ),
                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isRegistered ? Colors.grey : Colors.blue,
                      ),
                      onPressed: isRegistered
                          ? null
                          : () {
                        eventProvider.registerToEvent(event);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Inscription réussie 🎉'),
                          ),
                        );
                      },
                      child: Text(
                        isRegistered ? 'Déjà inscrit' : 'S’inscrire à l’événement',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
