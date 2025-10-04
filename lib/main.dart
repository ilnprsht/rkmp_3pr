import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    WelcomePage(),
    NotesPage(),
    TasksPage(),
    MoodPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Заметки'),
            BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Задачи'),
            BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions), label: 'Настроение'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          ],
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главная')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Добро пожаловать в ежедневник!\n\n'
                'Здесь вы можете вести заметки, управлять задачами, '
                'отмечать настроение и просматривать профиль.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _notes = [];

  void _addNote() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _notes.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Заметки')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Введите заметку',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _addNote, child: const Text('Добавить')),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.note, color: Colors.blue),
                        const SizedBox(width: 10),
                        Text(
                          _notes[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
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

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final List<Map<String, dynamic>> _tasks = [
    {'title': 'Сделать дз по РКМП', 'done': false},
    {'title': 'Пройти 10000 шагов', 'done': false},
    {'title': 'Забрать посылку', 'done': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Задачи')),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(_tasks[index]['title']),
            value: _tasks[index]['done'],
            onChanged: (value) {
              setState(() {
                _tasks[index]['done'] = value!;
              });
            },
          );
        },
      ),
    );
  }
}

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  String _mood = '😊';


  void _setMood(String emoji) {
    setState(() {
      _mood = emoji;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настроение')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Сегодняшнее настроение: $_mood', style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _setMood('😃'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 80),
                  textStyle: const TextStyle(fontSize: 30),
                ),
                child: const Text('😃'),
              ),
              ElevatedButton(
                onPressed: () => _setMood('😐'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 80),
                  textStyle: const TextStyle(fontSize: 30),
                ),
                child: const Text('😐'),
              ),
              ElevatedButton(
                onPressed: () => _setMood('😢'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 80),
                  textStyle: const TextStyle(fontSize: 30),
                ),
                child: const Text('😢'),
              ),
            ],
          )

        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Профиль')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 40, child: Icon(Icons.person, size: 50)),
            SizedBox(height: 20),
            Text('Илонка', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('ilnprsht@example.com', style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
