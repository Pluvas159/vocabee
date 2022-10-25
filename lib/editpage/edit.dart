import 'package:flutter/material.dart';
import 'package:vocabee/editpage/modal.dart';

import '../misc/drawer.dart';

class Vocaedit extends StatefulWidget {
  Vocaedit({Key? key}) : super(key: key);

  @override
  _VocaeditState createState() => _VocaeditState();
}

class _VocaeditState extends State<Vocaedit> {
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
        child: Column(children: []),
      ),
      drawer: VocaDrawer(selected: 1),
    );
  }
}
