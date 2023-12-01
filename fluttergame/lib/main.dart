import 'package:flutter/material.dart';
import 'Game/game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GuessNumberGame(),
    );
  }
}

