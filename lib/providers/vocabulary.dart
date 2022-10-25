import 'package:flutter/material.dart';

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
      };
}
