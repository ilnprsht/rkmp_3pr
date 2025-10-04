import 'package:flutter/material.dart';

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
