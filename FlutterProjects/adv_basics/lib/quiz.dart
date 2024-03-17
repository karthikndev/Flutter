import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/home_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  var activeScreen = 'home_screen';
  final List<String> selectedAnswers = [];

  void switchScreen() {
    selectedAnswers.clear();
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length)
    {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz()
  {
    selectedAnswers.clear();
    setState(() {
        activeScreen = 'question-screen';
      });
  }

  @override
  Widget build(BuildContext context) {

    Widget screenWidget = HomeScreen(switchScreen);   
    if(activeScreen == 'question-screen')
    {
      screenWidget = QuestionScreen(chooseAnswer);
    }
    if(activeScreen == 'results-screen')
    {
      screenWidget = ResultScreen(selectedAnswers,restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Color.fromARGB(255, 66, 4, 88), Color.fromARGB(255, 76, 3, 100)])),
            child: screenWidget),
      ),
    );
  }
}
