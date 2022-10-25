import 'package:flutter/material.dart';

class EditModal extends StatefulWidget {
  @override
  _EditModalState createState() => _EditModalState();
}

class _EditModalState extends State<EditModal> {
  final editController = TextEditingController();
  final translateController = TextEditingController();
  String dropdownValue = 'English';
  String translateDropdownValue = 'German';
  final languages = <String>['English', 'Spanish', 'French', 'German'];
  final emojis = <String>['🇬🇧', '🇪🇸', '🇫🇷', '🇩🇪'];

  @override
  void dispose() {
    editController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Add a new word"),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: editController,
                    decoration: InputDecoration(
                      hintText: 'Enter a new word',
                      suffixIcon: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        borderRadius: BorderRadius.circular(10),
                        items: languages
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            alignment: Alignment.center,
                            child: Text(emojis[languages.indexOf(value)]),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      )),
                    ),
                  )),
              Text("Translate to"),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: translateController,
                    decoration: InputDecoration(
                      hintText: 'Translate to',
                      suffixIcon: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        value: translateDropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        borderRadius: BorderRadius.circular(10),
                        items: languages
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            alignment: Alignment.center,
                            child: Text(emojis[languages.indexOf(value)]),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            translateDropdownValue = newValue!;
                          });
                        },
                      )),
                    ),
                  )),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),
            ],
          ),
        ));
  }
}
