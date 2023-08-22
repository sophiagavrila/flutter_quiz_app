import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      // copilot set the width to be narrower than the screen
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 55,
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundColor:
                      (data['user_answer'] == data['correct_answer'])
                          ? const Color.fromARGB(255, 127, 198, 247)
                          : const Color.fromARGB(255, 255, 116, 249),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['question'] as String,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(data['user_answer'] as String, 
                      style: TextStyle(
                        color: (data['user_answer'] == data['correct_answer'])
                          ? const Color.fromARGB(255, 127, 198, 247)
                          : const Color.fromARGB(255, 255, 116, 249))),
                    Text(data['correct_answer'] as String, 
                      style: const TextStyle(color: Color.fromARGB(255, 127, 198, 247))),
                  ],
                ),
              ),
            ],
          );
        }).toList()),
      ),
    );
  }
}
