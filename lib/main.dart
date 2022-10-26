import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabee/homepage/home.dart';
import 'package:vocabee/load/splash.dart';
import 'package:vocabee/providers/vocabulary.dart';
import 'package:vocabee/quizpage/quiz.dart';
import 'package:vocabee/theme.dart';

import 'vocabularypage/vocabulary.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Vocabulary(), child: Vocabee()),
  );
}

class Vocabee extends StatelessWidget {
  const Vocabee({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vocabee',
      theme: AppTheme.dark(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      initialRoute: Load.route,
      routes: {
        Load.route: (context) => const Load(),
        Vocahome.route: (context) => const Vocahome(),
        VocabularyPage.route: (context) => VocabularyPage(),
        QuizPage.route: (context) => const QuizPage(),
      },
    );
  }
}
