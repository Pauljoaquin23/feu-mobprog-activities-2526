import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import 'summary_screen.dart';

class QuizScreen extends StatefulWidget {
  final QuizCategory category;
  const QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  late List<int?> selected; 

  @override
  void initState() {
    super.initState();
    selected = List<int?>.filled(widget.category.questions.length, null);
  }

  void _next() {
    if (currentIndex < widget.category.questions.length - 1) {
      setState(() => currentIndex++);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => SummaryScreen(
            category: widget.category,
            selectedIndices: selected,
            onRetake: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => QuizScreen(category: widget.category)),
              );
            },
          ),
        ),
      );
    }
  }

  void _prev() {
    if (currentIndex > 0) setState(() => currentIndex--);
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.category.questions[currentIndex];
    final total = widget.category.questions.length;

    return Scaffold(
      appBar: AppBar(title: Text('${widget.category.title} (${currentIndex + 1}/$total)')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  q.assetPath,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey.shade200,
                    alignment: Alignment.center,
                    child: const Text('Image unavailable'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              q.text,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            ...List.generate(q.options.length, (i) {
              final isSelected = selected[currentIndex] == i;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ChoiceChip(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: Text(q.options[i]),
                  ),
                  selected: isSelected,
                  onSelected: (_) => setState(() => selected[currentIndex] = i),
                  selectedColor: Colors.indigo.shade100,
                ),
              );
            }),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: currentIndex == 0 ? null : _prev,
                    icon: const Icon(Icons.arrow_back_rounded),
                    label: const Text('Previous'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _next,
                    icon: Icon(
                      currentIndex == total - 1 ? Icons.flag_rounded : Icons.arrow_forward_rounded,
                    ),
                    label: Text(currentIndex == total - 1 ? 'Finish' : 'Next'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
