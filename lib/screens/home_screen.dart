import 'package:flutter/material.dart';
import 'event_details_screen.dart';

class HomeScreen extends StatelessWidget {
  // Adicionamos um parâmetro para receber o tipo da igreja
  final String churchType;

  const HomeScreen({super.key, required this.churchType});

  @override
  Widget build(BuildContext context) {
    final List<String> events = [
      'Café partilhado',
      'Estudo Bíblico',
      'Ensaio do Coral',
      'Reunião de Jovens',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(churchType),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Pesquisar Evento',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    title: Text(event),
                    subtitle: const Text('Clique para ver os detalhes'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EventDetailsScreen(eventName: event),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_event');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}