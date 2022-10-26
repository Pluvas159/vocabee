import 'package:flutter/material.dart';
import 'package:vocabee/misc/appbar.dart';
import 'package:vocabee/misc/drawer.dart';
import 'package:vocabee/quizpage/quiz.dart';

class Vocahome extends StatefulWidget {
  const Vocahome({super.key});
  static const route = "/";

  @override
  _VocahomeState createState() => _VocahomeState();
}

class _VocahomeState extends State<Vocahome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vocabee'),
      ),
      body: Center(
        child: Column(children: [
          Text('Vocabee'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, QuizPage.route);
            },
            child: const Text('Take a quiz'),
          )
        ]),
      ),
      drawer: VocaDrawer(selected: 0),
    );
  }
}
