import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabee/homepage/home.dart';
import 'package:vocabee/providers/vocabulary.dart';
import 'package:vocabee/theme.dart';

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
      initialRoute: Vocahome.route,
      routes: {
        Vocahome.route: (context) => const Vocahome(),
      },
    );
  }
}
