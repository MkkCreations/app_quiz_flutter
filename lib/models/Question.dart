import 'package:app_quiz_flutter/models/Reponse.dart';

class Question {
  const Question({
    required this.question,
    required this.reponses,
    required this.type,
  });

  final String question;
  final List<Reponse> reponses;
  final String type;
}
