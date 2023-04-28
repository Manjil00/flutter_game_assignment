import 'dart:math';

import 'package:flutter/material.dart';

class PickANumberScreen extends StatefulWidget {
  const PickANumberScreen({super.key});

  @override
  _PickANumberScreenState createState() => _PickANumberScreenState();
}

class _PickANumberScreenState extends State<PickANumberScreen> {
  int _score = 0;
  int _round = 0;
  int _firstNumber = 0;
  int _secondNumber = 0;
  bool _isButtonDisabled = false;

  @override
  void initState() {
    super.initState();
    _generateNumbers();
  }

  void _generateNumbers() {
    setState(() {
      _round++;
      _firstNumber = Random().nextInt(100) + 1;
      do {
        _secondNumber = Random().nextInt(100) + 1;
      } while (_secondNumber == _firstNumber);
      _isButtonDisabled = false;
    });
  }

  void _pickNumber(int number) {
    setState(() {
      _isButtonDisabled = true;
      if ( _firstNumber>_secondNumber || _secondNumber>_firstNumber) {
        _score++;
      }
      if (_round < 10) {
        Future.delayed(const Duration(seconds: 1), () {
          _generateNumbers();
        });
      } else {
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text('Your score is $_score.'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _score = 0;
                  _round = 0;
                  _generateNumbers();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a Greater Number Game'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Round $_round',
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _isButtonDisabled
                      ? null
                      : () => _pickNumber(_firstNumber),
                  child: Text('$_firstNumber'),
                ),
                ElevatedButton(
                  onPressed: _isButtonDisabled
                      ? null
                      : () => _pickNumber(_secondNumber),
                  child: Text('$_secondNumber'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              'Score: $_score',
              style: const TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
