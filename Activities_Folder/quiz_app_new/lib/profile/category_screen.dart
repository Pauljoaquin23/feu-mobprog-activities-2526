import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../models/quiz_model.dart';
import 'quiz_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Category')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: quizCategories.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final QuizCategory cat = quizCategories[index];
          return Card(
            child: ListTile(
              leading: Icon(cat.icon),
              title: Text(cat.title, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(cat.description),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => QuizScreen(category: cat)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
