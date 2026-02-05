import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1565C0),
                  Color(0xFF42A5F5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'John Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'john.doe@email.com',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          _drawerItem(
            context,
            icon: Icons.home_outlined,
            text: 'Accueil',
            route: '/main',
          ),
          _drawerItem(
            context,
            icon: Icons.event_available_outlined,
            text: 'Mes événements',
            route: '/main',
          ),
          _drawerItem(
            context,
            icon: Icons.notifications_outlined,
            text: 'Notifications',
            route: '/main',
          ),
          _drawerItem(
            context,
            icon: Icons.person_outline,
            text: 'Profil',
            route: '/main',
          ),
          _drawerItem(
            context,
            icon: Icons.settings_outlined,
            text: 'Paramètres',
            route: '/main',
          ),

          const Spacer(),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Déconnexion',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                    (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(
      BuildContext context, {
        required IconData icon,
        required String text,
        required String route,
      }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey),
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
