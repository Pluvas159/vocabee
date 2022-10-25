import 'package:flutter/material.dart';

import '../vocabularypage/vocabulary.dart';
import '../homepage/home.dart';

class VocaDrawer extends StatelessWidget {
  VocaDrawer({Key? key, required this.selected}) : super(key: key);
  int selected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            height: 120,
            child: Image.asset('assets/bee.png'),
          ),
          VocaTile(context, 'Home', Vocahome(), selected, 0),
          VocaTile(context, 'Vocabulary', VocabularyPage(), selected, 1),
        ],
      ),
    );
  }
}

Widget VocaTile(
    BuildContext context, String title, Widget route, int selected, int index) {
  return ListTile(
    title: Text(title),
    selected: selected == index,
    selectedTileColor: Theme.of(context).appBarTheme.backgroundColor,
    selectedColor: Colors.black,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => route),
      );
    },
  );
}
