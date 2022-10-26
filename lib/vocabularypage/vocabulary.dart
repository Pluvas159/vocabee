import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabee/config/config.dart';
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
  String filterValue = 'English';
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
          Container(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Row(children: [
                const Text(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  'Your own vocabulary',
                ),
                //make a dropdownbutton with languages as items
                const SizedBox(
                  width: 20,
                ),
                DropdownButton(
                  value: filterValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  elevation: 16,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      filterValue = newValue!;
                    });
                  },
                  items: Config.languages
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child:
                          Text(Config.emojis[Config.languages.indexOf(value)]),
                    );
                  }).toList(),
                ),
              ])),
          const Divider(),
          Consumer<Vocabulary>(builder: (context, voca, child) {
            return isNotEmptyForLanguage(voca.vocabulary, filterValue)
                ? Expanded(
                    child: ListView.builder(
                      itemCount: voca.vocabulary.length,
                      itemBuilder: (context, index) {
                        if (voca.vocabulary[index].from != filterValue &&
                            voca.vocabulary[index].to != filterValue) {
                          return const SizedBox.shrink();
                        }
                        return Column(children: [
                          voca.vocabulary[index].from == filterValue
                              ? VocaListTile(
                                  context,
                                  voca.vocabulary[index].word,
                                  '${Config.languageToEmoji[voca.vocabulary[index].to]}  ${voca.vocabulary[index].translation}',
                                  index)
                              : VocaListTile(
                                  context,
                                  voca.vocabulary[index].translation,
                                  '${Config.languageToEmoji[voca.vocabulary[index].from]}  ${voca.vocabulary[index].word}',
                                  index),
                          const Divider()
                        ]);
                      },
                    ),
                  )
                : Center(child: Text('No vocabulary yet for $filterValue'));
          })
        ]),
      ),
      drawer: VocaDrawer(selected: 1),
    );
  }
}

bool isNotEmptyForLanguage(List list, String language) {
  for (int i = 0; i < list.length; i++) {
    if (list[i].from == language || list[i].to == language) {
      return true;
    }
  }
  return false;
}

Widget VocaListTile(
    BuildContext context, String title, String subtitle, int index) {
  return Consumer<Vocabulary>(builder: (context, voca, child) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 20, right: 10),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: IconButton(
        icon: Icon(Icons.delete,
            color: Theme.of(context).appBarTheme.backgroundColor),
        onPressed: () {
          voca.removeEntryAt(index);
        },
      ),
    );
  });
}
