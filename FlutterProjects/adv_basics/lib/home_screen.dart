
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.quizClick, {super.key});

final void Function() quizClick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/quiz-logo.png',
                  width: 300,
                  color: const Color.fromARGB(167, 255, 255, 255),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Learn Flutter the fun way!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                OutlinedButton.icon(
                    onPressed: quizClick,
                    style:
                        OutlinedButton.styleFrom(foregroundColor: Colors.white),
                    icon: const Icon(Icons.arrow_right),
                    label: const Text('Start Quiz'))
              ],
            ),
    );
  }
}
