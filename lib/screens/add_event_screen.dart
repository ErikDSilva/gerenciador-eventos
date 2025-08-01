import 'package:flutter/material.dart';
import '../models/church_profile_model.dart';
import '../models/event_model.dart';

class AddEventScreen extends StatefulWidget {
  final ChurchProfile church;

  const AddEventScreen({super.key, required this.church});

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _saveEvent() async {
    if (_formKey.currentState!.validate()) {
      final newEvent = Event(
        name: _nameController.text,
        date: _dateController.text,
        description: _descriptionController.text,
      );

      widget.church.events.add(newEvent);
      
      await widget.church.save();

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Novo Evento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome do Evento'),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'Data', hintText: 'DD/MM/AAAA'),
                keyboardType: TextInputType.datetime,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                maxLines: 4,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _saveEvent,
                child: const Text('Salvar Evento'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}