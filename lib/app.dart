import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game_assignment/view/game_home_vieww.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pick a Greater Number Game',
       initialRoute: '/',
      routes: {
        '/': (context) => PickANumberScreen(),
      },
    );
  }
}