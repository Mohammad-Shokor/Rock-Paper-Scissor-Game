import 'package:flutter/material.dart';
import 'package:rockpaperscissors/RockPaperScissors.dart';
// import 'package:rockpaperscissors/RockPaperScissorsCool.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Paper Scissors',
      home: RockPaperScissors(), // This is boring version
      // home:Rockpaperscissorscool() // this is cool version, comment the above and uncomment here
    );
  }
}
