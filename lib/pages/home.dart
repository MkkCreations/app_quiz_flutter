import 'package:app_quiz_flutter/models/Question.dart';
import 'package:app_quiz_flutter/models/Reponse.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'widgets/theRow.dart';
import '../models/Quiz.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final quizes = <Quiz>[
    Quiz(
        name: 'Les Pays',
        description:
            "Ce quiz vous permettra de tester vos connaissances sur les pays du monde",
        questions: [
          Question(
            question: 'Quelle est la capitale de la France ?',
            reponses: [
              Reponse(id: 1, reponse: 'Paris', isCorrect: true),
            ],
            type: 'text',
          ),
          Question(
            question: 'Quelle est la capitale de l\'Espagne ?',
            reponses: [
              Reponse(id: 1, reponse: 'Sevilla', isCorrect: false),
              Reponse(id: 2, reponse: 'Barcelona', isCorrect: false),
              Reponse(id: 3, reponse: 'Madrid', isCorrect: true),
              Reponse(id: 4, reponse: 'Marselle', isCorrect: false),
            ],
            type: 'radio',
          ),
          Question(
            question: 'Quelle est la capitale de l\'Allemagne ?',
            reponses: [
              Reponse(id: 2, reponse: 'Munich', isCorrect: false),
              Reponse(id: 1, reponse: 'Berlin', isCorrect: true),
              Reponse(id: 3, reponse: 'Hambourg', isCorrect: false),
              Reponse(id: 4, reponse: 'Francfort', isCorrect: false),
            ],
            type: 'radio',
          ),
          Question(
            question: 'Quelle est la capitale de l\'Italie ?',
            reponses: [
              Reponse(id: 1, reponse: 'Rome', isCorrect: true),
              Reponse(id: 2, reponse: 'Milan', isCorrect: false),
              Reponse(id: 3, reponse: 'Venise', isCorrect: false),
              Reponse(id: 4, reponse: 'Naples', isCorrect: false),
            ],
            type: 'radio',
          ),
          Question(
            question: 'Quelle est la capitale de l\'Angleterre ?',
            reponses: [
              Reponse(id: 2, reponse: 'Liverpool', isCorrect: false),
              Reponse(id: 3, reponse: 'Manchester', isCorrect: false),
              Reponse(id: 4, reponse: 'Birmingham', isCorrect: false),
              Reponse(id: 1, reponse: 'Londres', isCorrect: true),
            ],
            type: 'radio',
          ),
        ]
        // questions: questions1,
        ),
    Quiz(
        name: 'Le Sport',
        description:
            "Ce quiz vous permettra de tester vos connaissances sur le sport",
        questions: [
          Question(
            question: 'Quelle footballeur a gagné le ballon d\'or en 2020 ?',
            reponses: [
              Reponse(id: 1, reponse: 'Cristiano Ronaldo', isCorrect: false),
              Reponse(id: 2, reponse: 'Lionel Messi', isCorrect: false),
              Reponse(id: 3, reponse: 'Robert Lewandowski', isCorrect: true),
              Reponse(id: 4, reponse: 'Neymar', isCorrect: false),
            ],
            type: 'radio',
          ),
          Question(
            question: 'Quelle footballeur a gagné le ballon d\'or en 2019 ?',
            reponses: [
              Reponse(id: 1, reponse: 'Cristiano Ronaldo', isCorrect: false),
              Reponse(id: 2, reponse: 'Lionel Messi', isCorrect: true),
              Reponse(id: 3, reponse: 'Robert Lewandowski', isCorrect: false),
              Reponse(id: 4, reponse: 'Neymar', isCorrect: false),
            ],
            type: 'radio',
          ),
          Question(
            question:
                'Quelle pays a gagné la coupe du monde de football en 2018 ?',
            reponses: [
              Reponse(id: 1, reponse: 'France', isCorrect: true),
              Reponse(id: 2, reponse: 'Allemagne', isCorrect: false),
              Reponse(id: 3, reponse: 'Espagne', isCorrect: false),
              Reponse(id: 4, reponse: 'Brésil', isCorrect: false),
            ],
            type: 'radio',
          ),
          Question(
            question:
                'Quelle pays a gagné la coupe du monde de football en 2014 ?',
            reponses: [
              Reponse(id: 1, reponse: 'France', isCorrect: false),
              Reponse(id: 2, reponse: 'Allemagne', isCorrect: true),
              Reponse(id: 3, reponse: 'Espagne', isCorrect: false),
              Reponse(id: 4, reponse: 'Brésil', isCorrect: false),
            ],
            type: 'radio',
          ),
          Question(
            question:
                'Quelle pays a gagné la coupe du monde de football en 2010 ?',
            reponses: [
              Reponse(id: 1, reponse: 'France', isCorrect: false),
              Reponse(id: 2, reponse: 'Allemagne', isCorrect: false),
              Reponse(id: 3, reponse: 'Espagne', isCorrect: true),
              Reponse(id: 4, reponse: 'Brésil', isCorrect: false),
            ],
            type: 'radio',
          ),
          Question(
            question: 'Qui est le meilleur buteur de l\'histoire du football ?',
            reponses: [
              Reponse(id: 1, reponse: 'Cristiano Ronaldo', isCorrect: false),
              Reponse(id: 2, reponse: 'Lionel Messi', isCorrect: false),
              Reponse(id: 3, reponse: 'Pelé', isCorrect: false),
              Reponse(id: 4, reponse: 'Joseph Bican', isCorrect: true),
            ],
            type: 'radio',
          ),
        ]
        // questions: questions1,
        ),
    Quiz(
      name: 'Les entreprises',
      description:
          "Ce quiz vous permettra de tester vos connaissances sur les entreprises",
      questions: [
        Question(
          question: 'Quelle est la plus grande entreprise du monde ?',
          reponses: [
            Reponse(id: 2, reponse: 'Amazon', isCorrect: true),
          ],
          type: 'text',
        ),
        Question(
          question: 'Quelle est la plus grande entreprise de France ?',
          reponses: [
            Reponse(id: 2, reponse: 'Total', isCorrect: true),
          ],
          type: 'text',
        ),
        Question(
          question: 'Quelle est la plus grande entreprise d\'Allemagne ?',
          reponses: [
            Reponse(id: 1, reponse: 'Volkswagen', isCorrect: false),
            Reponse(id: 2, reponse: 'BMW', isCorrect: false),
            Reponse(id: 3, reponse: 'Daimler', isCorrect: false),
            Reponse(id: 4, reponse: 'Siemens', isCorrect: true),
          ],
          type: 'radio',
        ),
        Question(
          question: 'Quelle est la plus grande entreprise d\'Italie ?',
          reponses: [
            Reponse(id: 1, reponse: 'Enel', isCorrect: false),
            Reponse(id: 2, reponse: 'Intesa Sanpaolo', isCorrect: false),
            Reponse(id: 3, reponse: 'Eni', isCorrect: false),
            Reponse(id: 4, reponse: 'Exor', isCorrect: true),
          ],
          type: 'radio',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 60),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 30),
                Expanded(
                  child: Text(
                    'Bienvenue sur l\'application de quiz',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 30),
                const Expanded(
                  child: Text(
                    'Choisissez un quiz',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            for (final quiz in quizes)
              InkWell(
                onTap: () => Navigator.pushNamed(context, PageName.detail,
                    arguments: [quiz, quiz.questions[0]]),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: TheRow(
                    label: quiz.name,
                    description: quiz.description,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
