import 'package:app_quiz_flutter/models/Question.dart';

class Quiz {
  const Quiz({
    required this.name,
    required this.description,
    required this.questions,
  });

  final String name;
  final String description;
  final List<Question> questions;
}
