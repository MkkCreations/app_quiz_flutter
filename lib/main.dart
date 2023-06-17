import 'package:flutter/material.dart';

import 'pages/endPage.dart';
import 'pages/quizPage.dart';
import 'pages/home.dart';

void main() => runApp(
      const MyApp(),
    );

class PageName {
  static const String home = '/';
  static const String detail = '/detail_page';
  static const String end = '/end_page';
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // <== définit le thème Light
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        // <== définit le thème Dark
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light, // <== on choisit le Dark
      initialRoute: PageName.home,
      routes: {
        PageName.home: (context) => const HomePage(),
        PageName.detail: (context) => const QuizPage(),
        PageName.end: (context) => const EndPage(),
      },
    );
  }
}
