import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Vocabulary extends ChangeNotifier {
  List<VocabularyEntry> _vocabulary = [];
  List<VocabularyEntry> get vocabulary => _vocabulary;

  void addEntry(VocabularyEntry entry) {
    _vocabulary.add(entry);
    notifyListeners();
  }

  void removeEntry(VocabularyEntry entry) {
    _vocabulary.remove(entry);
    notifyListeners();
  }

  void removeEntryAt(int index) {
    _vocabulary.removeAt(index);
    save();
    notifyListeners();
  }

  void clear() {
    _vocabulary.clear();
    notifyListeners();
  }

  void load(List<VocabularyEntry> entries) {
    _vocabulary = entries;
    notifyListeners();
  }

  void save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(_vocabulary);

    prefs.setString('vocabulary', jsonEncode(_vocabulary));
  }

  Future<void> loadFromMemory() async {
    // load json string from shared preferences as "vocabulary" and convert it to a list of VocabularyEntry
    // then call load()
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('vocabulary');
    if (json != null) {
      load(vocabularyFromJson(jsonDecode(json)));
    }
  }

  List<VocabularyEntry> vocabularyFromJson(List<dynamic> json) {
    // convert json string to a list of VocabularyEntry
    List<VocabularyEntry> entries = [];
    for (var entry in json) {
      entries.add(VocabularyEntry.fromJson(entry));
    }
    return entries;
  }
}

class VocabularyEntry {
  String word;
  String translation;
  String from;
  String to;

  VocabularyEntry({
    required this.word,
    required this.translation,
    required this.from,
    required this.to,
  });

  factory VocabularyEntry.fromJson(Map<String, dynamic> json) {
    return VocabularyEntry(
      word: json['word'],
      translation: json['translation'],
      from: json['from'],
      to: json['to'],
    );
  }

  Map<String, dynamic> toJson() => {
        'word': word,
        'translation': translation,
        'from': from,
        'to': to,
      };
}
