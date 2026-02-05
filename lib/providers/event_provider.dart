import 'package:flutter/material.dart';
import '../models/event.dart';

class EventProvider with ChangeNotifier {
  final List<Event> _events = [
    Event(
      id: '1',
      title: 'AI Conference - UEMF',
      date: '20 May 2025',
      location: 'Main Hall',
      organizer: 'AI Club',
      imageUrl:
      'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?fit=crop&w=800&q=80',
    ),
    Event(
      id: '2',
      title: 'Cyclism Tournament',
      date: '22 May 2025',
      location: 'Sports Center',
      organizer: 'Sports Club',
      imageUrl:
      'https://images.unsplash.com/photo-1517649763962-0c623066013b?fit=crop&w=800&q=80',
    ),
    Event(
      id: '3',
      title: 'Coding Workshop',
      date: '25 May 2025',
      location: 'Lab 101',
      organizer: 'Coding Club',
      imageUrl:
      'https://images.unsplash.com/photo-1599058917210-233cf7a89c50?fit=crop&w=800&q=80',
    ),
  ];

  final List<Event> _myEvents = [];

  // Tous les événements
  List<Event> get events => _events;

  // Événements où je suis inscrit
  List<Event> get myEvents => _myEvents;

  // S'inscrire à un événement
  void registerToEvent(Event event) {
    if (!_myEvents.contains(event)) {
      _myEvents.add(event);
      notifyListeners();
    }
  }

  // Ajouter directement un événement à mes événements (pour test/demo)
  void addToMyEvents(Event event) {
    if (!_myEvents.contains(event)) {
      _myEvents.add(event);
      notifyListeners();
    }
  }
}
