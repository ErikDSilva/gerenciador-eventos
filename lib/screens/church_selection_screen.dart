import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/church_profile_model.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class ChurchSelectionScreen extends StatelessWidget {
  const ChurchSelectionScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    final settingsBox = Hive.box('settings');
    await settingsBox.put('isLoggedIn', false);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione o Perfil'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
            tooltip: 'Sair',
          ),
        ],
      ),
      body: ValueListenableBuilder<Box<ChurchProfile>>(
        valueListenable: Hive.box<ChurchProfile>('churches').listenable(),
        builder: (context, box, _) {
          final churches = box.values.toList().cast<ChurchProfile>();
          if (churches.isEmpty) {
            return const Center(
              child: Text(
                'Nenhuma igreja cadastrada.\nClique em "+" para adicionar a primeira!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: churches.length,
            itemBuilder: (context, index) {
              final church = churches[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                child: ListTile(
                  leading: Icon(
                    IconData(church.iconCodePoint, fontFamily: 'MaterialIcons'),
                    size: 40,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(church.title, style: const TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(church: church),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_church');
        },
        child: const Icon(Icons.add),
        tooltip: 'Adicionar Igreja',
      ),
    );
  }
}