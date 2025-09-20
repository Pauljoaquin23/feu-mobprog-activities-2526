import 'package:flutter/material.dart';

class Question {
  final String text;
  final List<String> options; 
  final int correctIndex;
  final String assetPath; 

  Question({
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.assetPath,
  }) : assert(options.length >= 2 && options.length <= 4,
              'Each question must have 2–4 options');
}

class QuizCategory {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final List<Question> questions; 

  QuizCategory({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.questions,
  }) : assert(questions.length == 10, 'Each category must have 10 questions');
}
