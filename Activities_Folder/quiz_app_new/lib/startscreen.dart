import 'package:flutter/material.dart';
import 'profile/category_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.play_arrow_rounded),
          label: const Text('Start'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CategoryScreen()),
            );
          },
        ),
      ),
    );
  }
}
