import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_event_screen.dart';
import 'screens/church_selection_screen.dart';

void main() {
  runApp(const ChurchEventManager());
}

class ChurchEventManager extends StatelessWidget {
  const ChurchEventManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de Eventos da Igreja',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/church_selection': (context) => const ChurchSelectionScreen(),
        '/home': (context) => const HomeScreen(churchType: 'Igreja'),
        '/add_event': (context) => const AddEventScreen(),
      },
    );
  }
}