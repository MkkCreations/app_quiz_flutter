import 'package:app_quiz_flutter/main.dart';
import 'package:app_quiz_flutter/models/Question.dart';
import 'package:app_quiz_flutter/models/Quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EndPage extends StatefulWidget {
  const EndPage({
    super.key,
  });

  @override
  State<EndPage> createState() => _EndPage();
}

class _EndPage extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    final quiz = ModalRoute.of(context)!.settings.arguments as Quiz;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bravo !',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Vous avez terminé le quiz ${quiz.name}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Vous avez obtenu ${quiz.questions.length} points sur ${quiz.questions.length}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Retour à l\'accueil'),
            ),
          ],
        ),
      ),
    );
  }
}
