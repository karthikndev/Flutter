import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: data['item_color'] as Color,
                      borderRadius: BorderRadius.circular(25)),
                  width: 25,
                  height: 25,
                  child: Center(
                    child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.comicNeue(
                            color: Colors.black, fontSize: 14)),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'].toString(),
                          style: GoogleFonts.comicNeue(
                              color:const Color.fromARGB(255, 255, 223, 255), fontSize: 14,
                              fontWeight:FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['chosen_answer'].toString(),
                          style: GoogleFonts.comicNeue(
                              color: const Color.fromARGB(255, 251, 125, 215), fontSize: 14)),
                      Text(data['correct_answer'].toString(),
                          style: GoogleFonts.comicNeue(
                              color: const Color.fromARGB(255, 128, 207, 234), fontSize: 14)),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
