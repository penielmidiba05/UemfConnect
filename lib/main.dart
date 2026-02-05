import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // <-- nouveau

import 'providers/event_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/event_detail_screen.dart';
import 'screens/main_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 🔹 Création du provider
  final eventProvider = EventProvider();

  // 🔹 Ajout automatique de quelques événements pour tester "My Events"
  eventProvider.addToMyEvents(eventProvider.events[0]); // AI Conference
  eventProvider.addToMyEvents(eventProvider.events[1]); // Basketball Tournament

  runApp(
    ChangeNotifierProvider(
      create: (_) => eventProvider,
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/main': (context) => const MainLayout(),
        '/eventDetails': (context) => EventDetailScreen(),
      },
    );
  }
}

