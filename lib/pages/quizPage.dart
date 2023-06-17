import 'package:app_quiz_flutter/main.dart';
import 'package:app_quiz_flutter/models/Question.dart';
import 'package:app_quiz_flutter/models/Quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
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

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as List;

    final quiz = data[0] as Quiz;
    final question = data[1] as Question;

    if (question.type == "radio") {
      return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      PageName.home,
                      arguments: quiz,
                    );
                  },
                  icon: const Icon(Icons.home),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              Container(
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 99, 154, 227).withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(question.question,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    for (final reponse in question.reponses)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ElevatedButton(
                          onPressed: () {
                            if (reponse.isCorrect == false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Mauvaise réponse'),
                                  backgroundColor: Colors.red,
                                  duration: Duration(milliseconds: 800),
                                ),
                              );
                              return;
                            }

                            if (quiz.questions.indexOf(question) + 1 <
                                    quiz.questions.length &&
                                reponse.isCorrect == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Bonne réponse'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(milliseconds: 500),
                                ),
                              );
                            }

                            if (quiz.questions.indexOf(question) + 1 ==
                                    quiz.questions.length &&
                                reponse.isCorrect == true) {
                              Navigator.pushNamed(
                                context,
                                PageName.end,
                                arguments: quiz,
                              );
                              return;
                            }
                            Navigator.pushNamed(
                              context,
                              PageName.detail,
                              arguments: [
                                quiz,
                                quiz.questions[
                                    quiz.questions.indexOf(question) + 1],
                              ],
                            );
                          },
                          child: Text(reponse.reponse),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(175, 59, 161, 61),
                            onPrimary: Colors.white,
                            minimumSize: const Size(200, 50),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Text(
                quiz.questions.indexOf(question).toString() +
                    "/" +
                    quiz.questions.length.toString(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      PageName.home,
                      arguments: quiz,
                    );
                  },
                  icon: const Icon(Icons.home),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              Container(
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 99, 154, 227).withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(question.question,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Réponse',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(100),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ButtonBar(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (controller.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Veuillez saisir une réponse'),
                                  backgroundColor: Colors.red,
                                  duration: Duration(milliseconds: 500),
                                ),
                              );
                              return;
                            } else if (controller.text.toLowerCase() !=
                                question.reponses[0].reponse.toLowerCase()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Mauvaise réponse -- Correct -> (${question.reponses[0].reponse})'),
                                  backgroundColor: Colors.red,
                                  duration: const Duration(milliseconds: 800),
                                ),
                              );
                              return;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Bonne réponse'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(milliseconds: 500),
                                ),
                              );
                            }
                            if (quiz.questions.indexOf(question) + 1 <
                                quiz.questions.length) {
                              Navigator.pushNamed(
                                context,
                                PageName.detail,
                                arguments: [
                                  quiz,
                                  quiz.questions[
                                      quiz.questions.indexOf(question) + 1],
                                ],
                              );
                            } else {
                              Navigator.pushNamed(
                                context,
                                PageName.end,
                                arguments: quiz,
                              );
                            }
                          },
                          child: const Text('Suivant'),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(156, 39, 151, 41),
                            onPrimary: Colors.white,
                            minimumSize: const Size(200, 40),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                quiz.questions.indexOf(question).toString() +
                    "/" +
                    quiz.questions.length.toString(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    }
  }
}
