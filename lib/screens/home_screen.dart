import 'package:flutter/material.dart';
import '../models/church_profile_model.dart';
import '../models/event_model.dart';
import 'event_details_screen.dart';
import 'add_event_screen.dart';

class HomeScreen extends StatefulWidget {
  final ChurchProfile church;

  const HomeScreen({super.key, required this.church});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.church.title),
        centerTitle: true,
      ),
      body: widget.church.events.isEmpty
          ? const Center(
              child: Text(
                'Ainda não há eventos cadastrados.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: widget.church.events.length,
              itemBuilder: (context, index) {
                final event = widget.church.events[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    title: Text(event.name),
                    subtitle: Text(event.date),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailsScreen(event: event),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEventScreen(church: widget.church),
            ),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
        tooltip: 'Adicionar Evento',
      ),
    );
  }
}