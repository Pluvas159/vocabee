import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabee/providers/quiz.dart';
import 'dart:math' as math;
import '../config/config.dart';
import '../providers/vocabulary.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  static const route = "/quiz";

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
    initQuiz(context);
  }

  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
      appBar: AppBar(
        title: Consumer<QuizProvider>(
          builder: (context, quiz, child) {
            return Text('${quiz.quizLanguage} quiz');
          },
        ),
      ),
      body: Center(
        child: Consumer<QuizProvider>(
          builder: (context, quiz, child) {
            return quiz.questions.isNotEmpty &&
                    quiz.currentQuestion < quiz.questionsCount
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        SizedBox(
                            height: 300,
                            width: 400,
                            child: PageView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: controller,
                                itemCount: quiz.questions.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                      margin: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .backgroundColor,
                                      ),
                                      alignment: Alignment.center,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                                Config.languageToEmoji[
                                                    quiz.quizLanguage]!,
                                                style: const TextStyle(
                                                    fontSize: 30)),
                                            Text(
                                              quiz.questions[index].word,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                                Config.languageToEmoji[
                                                    quiz.questions[index].to]!,
                                                style: const TextStyle(
                                                    fontSize: 30)),
                                            Text(
                                              showAnswer == true
                                                  ? quiz.questions[index]
                                                      .translation
                                                  : '?',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ]));
                                })),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    showAnswer = true;
                                  });
                                },
                                child: const Icon(Icons.close),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40))),
                                onPressed: () {
                                  if (quiz.currentQuestion + 1 ==
                                      quiz.questions.length) {
                                    quiz.currentQuestion = 0;
                                    quiz.questions = [];
                                    Navigator.pop(context);
                                  }
                                  setState(() {
                                    quiz.currentQuestion++;
                                    controller.nextPage(
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.ease);
                                    showAnswer = false;
                                  });
                                },
                                child: Icon(Icons.check_sharp),
                              )
                            ]),
                      ])
                : Text("No questions");
          },
        ),
      ),
    );
  }
}

void initQuiz(BuildContext context) {
  final quiz = Provider.of<QuizProvider>(context, listen: false);
  quiz.correctAnswers = 0;
  quiz.wrongAnswers = 0;
  quiz.currentQuestion = 0;
  quiz.questions = generateQuestions(context, quiz.quizLanguage);
  quiz.questionsCount = quiz.questions.length;
}

List<VocabularyEntry> generateQuestions(BuildContext context, String language) {
  final vocabulary = Provider.of<Vocabulary>(context, listen: false);
  final questions = vocabulary.vocabulary
      .where((element) => element.from == language || element.to == language)
      .map((e) => e.from == language
          ? VocabularyEntry(
              word: e.word, translation: e.translation, from: e.from, to: e.to)
          : VocabularyEntry(
              word: e.translation, translation: e.word, from: e.to, to: e.from))
      .toList();
  questions.shuffle();
  return questions;
}
