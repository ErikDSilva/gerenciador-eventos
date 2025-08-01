import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/church_profile_model.dart';
import 'models/event_model.dart';

import 'screens/login_screen.dart';
import 'screens/church_selection_screen.dart';
import 'screens/add_church_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ChurchProfileAdapter());
  Hive.registerAdapter(EventAdapter());

  final settingsBox = await Hive.openBox('settings');
  await Hive.openBox<ChurchProfile>('churches');

  final bool isLoggedIn = settingsBox.get('isLoggedIn', defaultValue: false);

  runApp(ChurchEventManager(isLoggedIn: isLoggedIn));
}

class ChurchEventManager extends StatelessWidget {
  final bool isLoggedIn;

  const ChurchEventManager({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de Eventos da Igreja (Hive)',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: isLoggedIn ? '/church_selection' : '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/church_selection': (context) => const ChurchSelectionScreen(),
        '/add_church': (context) => const AddChurchScreen(),
      },
    );
  }
}