import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabee/misc/appbar.dart';
import 'package:vocabee/misc/drawer.dart';
import 'package:vocabee/quizpage/quiz.dart';

import '../config/config.dart';
import '../providers/quiz.dart';

class Vocahome extends StatefulWidget {
  const Vocahome({super.key});
  static const route = "/";

  @override
  _VocahomeState createState() => _VocahomeState();
}

class _VocahomeState extends State<Vocahome> {
  String languageValue = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vocabee'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          DropdownButton(
            value: languageValue,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 30,
            elevation: 16,
            underline: Container(
              height: 0,
            ),
            onChanged: (String? newValue) {
              setState(() {
                languageValue = newValue!;
                Provider.of<QuizProvider>(context, listen: false)
                    .setQuizLanguage(newValue);
              });
            },
            items:
                Config.languages.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(Config.emojis[Config.languages.indexOf(value)]),
              );
            }).toList(),
          ),
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
