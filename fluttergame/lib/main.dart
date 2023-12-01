import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GuessNumberGame(),
    );
  }
}

class GuessNumberGame extends StatefulWidget {
  @override
  _GuessNumberGameState createState() => _GuessNumberGameState();
}

class _GuessNumberGameState extends State<GuessNumberGame> {
  final Random _random = Random();
  late int _maxNumbers;
  late int _targetNumber;
  late int _userGuess;
  late String _resultMessage;

  @override
  void initState() {
    super.initState();
    _maxNumbers = 10; // Valor padrão
    _startGame();
  }

  void _startGame() {
    setState(() {
      _targetNumber = _random.nextInt(_maxNumbers + 1);
      _userGuess = 0; // ou qualquer outro valor inicial desejado
      _resultMessage = "Tente adivinhar o número!";
    });
  }

  void _makeGuess() {
    setState(() {
      if (_userGuess == _targetNumber) {
        _resultMessage = "Parabéns! Você acertou $_targetNumber!";
      } else if (_userGuess < _targetNumber) {
        _resultMessage = "Tente novamente. Dica: O número é maior.";
      } else {
        _resultMessage = "Tente novamente. Dica: O número é menor.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo de Adivinhação'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _resultMessage,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _userGuess = int.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Seu Palpite',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _makeGuess,
              child: Text('Chutar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _startGame();
                });
              },
              child: Text('Reiniciar Jogo'),
            ),
            SizedBox(height: 20),
            Text('Escolha o número máximo de 1 a 20:'),
            Slider(
              value: _maxNumbers.toDouble(),
              min: 1,
              max: 20,
              divisions: 19,
              onChanged: (value) {
                setState(() {
                  _maxNumbers = value.toInt();
                  _startGame();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
