import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/vocabulary.dart';

class Load extends StatefulWidget {
  const Load({Key? key}) : super(key: key);

  static const route = "/load";

  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
  void initState() {
    super.initState();
    Provider.of<Vocabulary>(context, listen: false).loadFromMemory().then((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
                padding: EdgeInsets.all(80),
                child: Image.asset('assets/bee.png')),
            CircularProgressIndicator(
                color: Theme.of(context).appBarTheme.backgroundColor),
          ],
        ),
      ),
    );
  }
}
