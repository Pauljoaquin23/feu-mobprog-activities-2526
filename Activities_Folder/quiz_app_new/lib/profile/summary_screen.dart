import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import 'category_screen.dart';

class SummaryScreen extends StatelessWidget {
  final QuizCategory category;
  final List<int?> selectedIndices;
  final VoidCallback onRetake;

  const SummaryScreen({
    super.key,
    required this.category,
    required this.selectedIndices,
    required this.onRetake,
  });

  int get _score {
    int s = 0;
    for (var i = 0; i < category.questions.length; i++) {
      final picked = selectedIndices[i];
      if (picked != null && picked == category.questions[i].correctIndex) s++;
    }
    return s;
  }

  @override
  Widget build(BuildContext context) {
    final score = _score;
    final total = category.questions.length;

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Summary')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text('Score: $score / $total'),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: total,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final q = category.questions[index];
                final picked = selectedIndices[index];
                final isCorrect = picked != null && picked == q.correctIndex;

                final bgColor = isCorrect
                    ? Colors.green.withOpacity(0.12)
                    : Colors.red.withOpacity(0.12);

                return Container(
                  decoration: BoxDecoration(
                    color: bgColor, // BONUS: green/red background
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: isCorrect ? Colors.green : Colors.red),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Q${index + 1}. ${q.text}',
                          style: const TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Your answer: '),
                          Expanded(
                            child: Text(
                              picked == null ? '—' : q.options[picked],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: isCorrect
                                    ? Colors.green.shade800
                                    : Colors.red.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (!isCorrect)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Correct:     '),
                              Expanded(
                                child: Text(
                                  q.options[q.correctIndex],
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onRetake,
                    icon: const Icon(Icons.replay_rounded),
                    label: const Text('Retake this category'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const CategoryScreen()),
                        (route) => route.isFirst,
                      );
                    },
                    icon: const Icon(Icons.category_rounded),
                    label: const Text('Choose another category'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
