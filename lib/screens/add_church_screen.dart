import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/church_profile_model.dart';

class AddChurchScreen extends StatefulWidget {
  const AddChurchScreen({super.key});

  @override
  _AddChurchScreenState createState() => _AddChurchScreenState();
}

class _AddChurchScreenState extends State<AddChurchScreen> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _saveChurch() async {
    if (_formKey.currentState!.validate()) {
      final newChurch = ChurchProfile(
        title: _nameController.text,
        iconCodePoint: Icons.church.codePoint, 
        events: [],
      );

      final box = Hive.box<ChurchProfile>('churches');
      await box.add(newChurch);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Nova Igreja'),
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
                decoration: const InputDecoration(
                  labelText: 'Nome da Igreja',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório.' : null,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _saveChurch,
                child: const Text('Salvar Igreja'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}