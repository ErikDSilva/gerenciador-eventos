import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  final String eventName;

  const EventDetailsScreen({super.key, required this.eventName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(eventName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Detalhes do Evento:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Data: 01 de Agosto de 2025',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Horário: 19:30',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Local: Salão Principal',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Descrição:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}