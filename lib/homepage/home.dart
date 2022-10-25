import 'package:flutter/material.dart';
import 'package:vocabee/misc/appbar.dart';
import 'package:vocabee/misc/drawer.dart';

class Vocahome extends StatefulWidget {
  const Vocahome({super.key});
  static const route = "/";

  @override
  _VocahomeState createState() => _VocahomeState();
}

class _VocahomeState extends State<Vocahome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Vocabee'),
      ),
      body: Center(
        child: Text('Vocabee'),
      ),
      drawer: VocaDrawer(selected: 0), 
    );
  }
}