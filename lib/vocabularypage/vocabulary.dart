import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabee/providers/vocabulary.dart';
import 'package:vocabee/vocabularypage/modal.dart';

import '../misc/drawer.dart';

class VocabularyPage extends StatefulWidget {
  VocabularyPage({Key? key}) : super(key: key);

  static const route = '/vocabulary';

  @override
  _VocabularyPageState createState() => _VocabularyPageState();
}

class _VocabularyPageState extends State<VocabularyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Vocabee'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  anchorPoint: const Offset(0.5, 0.5),
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0)),
                  ),
                  backgroundColor: Theme.of(context).backgroundColor,
                  builder: (context) {
                    return EditModal();
                  });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(children: [
          Consumer<Vocabulary>(builder: (context, voca, child) {
            return Expanded(
              child: ListView.builder(
                itemCount: voca.vocabulary.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(voca.vocabulary[index].word),
                    subtitle: Text(voca.vocabulary[index].translation),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        voca.removeEntryAt(index);
                      },
                    ),
                  );
                },
              ),
            );
          })
        ]),
      ),
      drawer: VocaDrawer(selected: 1),
    );
  }
}
