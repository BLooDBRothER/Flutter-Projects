import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';


class QuizResponse extends StatelessWidget {
  
  const QuizResponse({super.key, required this.quizSummary, required this.restartQuiz});
  final Map<String, Object> quizSummary;
  final void Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final correctAnswers = quizSummary["totalCorrect"];
    final List<Map<String, String>> summary = quizSummary["quizSummary"] as List<Map<String, String>>;

    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You got $correctAnswers out of $totalQuestions answers correct", 
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...(summary.map((data) => Summary(questionNo: data["questionNo"] as String, question: data["question"] as String, correctAnswer: data["answer"] as String, userAnswer: data["userAnswer"] as String)))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton.icon(
              onPressed: restartQuiz, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade100,
                padding: const EdgeInsets.symmetric(horizontal: 20)
              ),
              icon: const Icon(Icons.restart_alt),
              label: const Text("Restart Quiz", textAlign: TextAlign.center,), 
            )
          ]
        ),
      ),
    );
  }
}

class Summary extends StatelessWidget {
  const Summary({
    super.key,
    required this.questionNo,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
  });

  final String questionNo;
  final String question;
  final String correctAnswer;
  final String userAnswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: (
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$questionNo. ", style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16
                  ),),
                ),
                Flexible(
                  child: Text(question, style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16
                  ),),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Text("Correct Answer: $correctAnswer", style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16
                  ),),
                  const SizedBox(height: 10,),
                  Text("Your Answer: $userAnswer", style: GoogleFonts.montserrat(
                        color: userAnswer == correctAnswer ? Colors.green : Colors.red,
                        fontSize: 16
                  ),)
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
