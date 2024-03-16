import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var diceImage = 'assets/images/dice-1.png';
final randomizer = Random();
  void rollDice() {

    int num = randomizer.nextInt(6) + 1 ;
    setState(() {
    diceImage = 'assets/images/dice-$num.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          diceImage,
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(color: Colors.black, fontSize: 28)),
            child: const Text('Roll Dice'))
      ],
    );
  }
}
