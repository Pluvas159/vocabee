import 'package:flutter/material.dart';
import 'package:vocabee/providers/vocabulary.dart';

class QuizProvider extends ChangeNotifier {
  String quizLanguage = "English";
  int questionsCount = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  int currentQuestion = 0;
  List<VocabularyEntry> questions = [];

  void setQuizLanguage(String language) {
    quizLanguage = language;
    notifyListeners();
  }
}
