import 'package:flutter/material.dart';

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
