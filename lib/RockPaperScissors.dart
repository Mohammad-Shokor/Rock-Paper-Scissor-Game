import 'dart:math';

import 'package:flutter/material.dart';

class RockPaperScissors extends StatefulWidget {
  const RockPaperScissors({super.key});

  @override
  State<RockPaperScissors> createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {
  List<String> choice = ['✊', '✋', '✌'];
  int You = 0;
  int Computer = 0;
  String yourChoice = '❓';
  String computerChoice = '❓';
  String results = '';
  void Choicemaker(int me, int comp) {
    setState(() {
      yourChoice = choice[me];
      computerChoice = choice[comp];
      if (me == comp) {
        // tie
        results = "It is a tie 😐";
      } else if ((me + 1) == comp || (me == 2 && comp == 0)) {
        //Lose
        results = "You Lose 😥";
        Computer++;
      } else {
        //win
        results = "You Won 🥳";
        You++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // title text
            Text(
              "Let's play Rock-Paper-Scissors",
              style: TextStyle(fontSize: 30),
            ),
            // sizedbox
            SizedBox(height: 90),
            // you then competitor ( each have string )
            Text(
              "You: $yourChoice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(
              "Computer: $computerChoice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: 20),
            //three buttons in row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    int temp = Random().nextInt(3);
                    Choicemaker(0, temp);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                  ),
                  child: Text(choice[0], style: TextStyle(fontSize: 50)),
                ), // rock
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    int temp = Random().nextInt(3);
                    Choicemaker(1, temp);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                  ),
                  child: Text(choice[1], style: TextStyle(fontSize: 50)),
                ), //paper
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    int temp = Random().nextInt(3);
                    Choicemaker(2, temp);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                  ),
                  child: Text(choice[2], style: TextStyle(fontSize: 50)),
                ), //scissors
              ],
            ),
            SizedBox(height: 20),
            //sizedbox at first or at refresh then result text
            results == ''
                ? SizedBox(height: 36)
                : Text(
                  results,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
            //your score vs competitor score
            SizedBox(height: 10),
            Text(
              "Your Score: $You    Computer Score: $Computer",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            // the try again button
            SizedBox(height: 20),
            IconButton(
              onPressed: () {
                setState(() {
                  results = '';
                  computerChoice = '❓';
                  yourChoice = '❓';
                  You = 0;
                  Computer = 0;
                });
              },
              icon: Icon(Icons.refresh, color: Colors.red, size: 40),
            ),
          ],
        ),
      ),
    );
  }
}
