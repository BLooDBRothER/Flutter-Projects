import "package:flutter/material.dart";
import "package:quiz_app/quiz_answer.dart";
import "package:quiz_app/data/questions.dart";
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key, required this.storeUserAnswer});

  final void Function(String) storeUserAnswer;

  @override
  State<Quiz> createState () => _Quiz();
}

class _Quiz extends State<Quiz> {
  int currentQuestionIndex = 0;

  void handleAnswerClick (String answer) {
    setState(() {
      widget.storeUserAnswer(answer);
      if(currentQuestionIndex + 1 == questions.length) {
        return;
      }
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        children: [
          Text(
            questions[currentQuestionIndex].question, 
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20,),
          ...(questions[currentQuestionIndex].shuffleAnswer().map((answer) => QuizAnswer(answerText: answer, handleAnswerClick: handleAnswerClick,)))
        ],
      ),
    );
  }
}
