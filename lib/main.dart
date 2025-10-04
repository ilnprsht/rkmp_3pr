import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'pages/notes_page.dart';
import 'pages/tasks_page.dart';
import 'pages/mood_page.dart';
import 'pages/profile_page.dart';

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
