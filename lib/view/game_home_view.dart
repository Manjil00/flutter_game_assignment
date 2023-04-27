// import 'package:flutter/material.dart';
// import 'dart:math';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pick a Greater Number Game',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: PickANumberScreen(),
//     );
//   }
// }

// class PickANumberScreen extends StatefulWidget {
//   @override
//   _PickANumberScreenState createState() => _PickANumberScreenState();
// }

// class _PickANumberScreenState extends State<PickANumberScreen> {
//   int _score = 0;
//   int _round = 0;
//   int _firstNumber = 0;
//   int _secondNumber = 0;
//   bool _isButtonDisabled = false;

//   @override
//   void initState() {
//     super.initState();
//     _generateNumbers();
//   }

//   void _generateNumbers() {
//     setState(() {
//       _round++;
//       _firstNumber = Random().nextInt(100) + 1;
//       do {
//         _secondNumber = Random().nextInt(100) + 1;
//       } while (_secondNumber == _firstNumber);
//       _isButtonDisabled = false;
//     });
//   }

//   void _pickNumber(int number) {
//     setState(() {
//       _isButtonDisabled = true;
//       if (number == _firstNumber || number == _secondNumber) {
//         _score++;
//       }
//       if (_round < 10) {
//         Future.delayed(Duration(seconds: 1), () {
//           _generateNumbers();
//         });
//       } else {
//         _showResultDialog();
//       }
//     });
//   }

//   void _showResultDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Game Over'),
//           content: Text('Your score is $_score.'),
//           actions: <Widget>[
//             ElevatedButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 setState(() {
//                   _score = 0;
//                   _round = 0;
//                   _generateNumbers();
//                 });
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pick a Greater Number Game'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Round $_round',
//               style: TextStyle(fontSize: 24.0),
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 ElevatedButton(
//                   child: Text('$_firstNumber'),
//                   onPressed: _isButtonDisabled ? null : () => _pickNumber(_firstNumber),
//                 ),
//                 ElevatedButton(
//                   child: Text('$_secondNumber'),
//                   onPressed: _isButtonDisabled ? null : () => _pickNumber(_secondNumber),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//                 Text(
//               'Score: $_score',
//               style: TextStyle(fontSize: 24.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }