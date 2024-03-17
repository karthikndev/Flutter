import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswer ,this.restartQuiz, {super.key});
  final List<String> chosenAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (int i = 0; i < chosenAnswer.length; i++) {

      var questionItemColor = chosenAnswer[i] == questions[i].answers[0] ? const Color.fromARGB(255, 128, 207, 234) : const Color.fromARGB(255, 251, 125, 215);

      summaryData.add({
        'question_index':i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'chosen_answer':chosenAnswer[i],
        'item_color':questionItemColor
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numTotalCorrectQuestions = summaryData.where((element) => element['chosen_answer'] == element['correct_answer']).length;
    
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have answered $numTotalCorrectQuestions out of $numTotalQuestions questions correctly!',
            style: GoogleFonts.comicNeue(color:Colors.white,
            fontSize:24,),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
                    onPressed: restartQuiz ,
                    style:
                        OutlinedButton.styleFrom(foregroundColor: Colors.white),
                    icon: const Icon(Icons.restart_alt),
                    label: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
