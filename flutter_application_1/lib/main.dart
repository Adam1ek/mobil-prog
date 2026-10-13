import 'package:flutter/material.dart';

void main() {
  runApp(const HobbyTrackerApp());
}

class HobbyTrackerApp extends StatelessWidget {
  const HobbyTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Хобби Трекер',
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      home: const HobbyHomeScreen(),
    );
  }
}

class HobbyHomeScreen extends StatefulWidget {
  const HobbyHomeScreen({super.key});

  @override
  State<HobbyHomeScreen> createState() => _HobbyHomeScreenState();
}

class _HobbyHomeScreenState extends State<HobbyHomeScreen> {
  // Список ваших хобби и заметок
  final List<String> _hobbies = [
    'Чтение книг',
    'Программирование',
    'Велосипед',
  ];

  final TextEditingController _controller = TextEditingController();

  void _addHobby() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _hobbies.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой Хобби-Трекер'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Поле для ввода нового хобби
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Новое хобби / заметка',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addHobby,
                  child: const Text('Добавить'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Список добавленных хобби
            Expanded(
              child: ListView.builder(
                itemCount: _hobbies.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.star, color: Colors.deepPurple),
                      title: Text(_hobbies[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
