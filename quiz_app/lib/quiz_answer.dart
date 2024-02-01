import "package:flutter/material.dart";

class QuizAnswer extends StatelessWidget {
  const QuizAnswer({super.key, required this.answerText, required this.handleAnswerClick});

  final String answerText;
  final void Function(String) handleAnswerClick;

  @override
  Widget build(BuildContext context) {
    return (
      ElevatedButton(
          onPressed: () {
            handleAnswerClick(answerText);
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple.shade100,
            padding: const EdgeInsets.symmetric(horizontal: 10)
          ),
          child: Text(answerText, textAlign: TextAlign.center,), 
        )
    );
  }
}
