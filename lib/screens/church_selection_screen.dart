import 'package:flutter/material.dart';
import 'home_screen.dart';

class ChurchSelectionScreen extends StatelessWidget {
  const ChurchSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildChurchProfileCard({
      required IconData icon,
      required String title,
      required VoidCallback onTap,
    }) {
      return Card(
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListTile(
          leading: Icon(icon, size: 40, color: Theme.of(context).primaryColor),
          title: Text(title, style: const TextStyle(fontSize: 18)),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: onTap,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione o Perfil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Pesquisar Perfil',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 40),

            const Text(
              'Ou selecione um dos perfis abaixo:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 20),
            buildChurchProfileCard(
              icon: Icons.church,
              title: 'Igreja 1',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const HomeScreen(churchType: 'Igreja 1'),
                  ),
                );
              },
            ),
            buildChurchProfileCard(
              icon: Icons.book,
              title: 'Igreja 2',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const HomeScreen(churchType: 'Igreja 2'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}