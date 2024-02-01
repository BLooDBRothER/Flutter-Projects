import "package:flutter/material.dart";

class QuizHome extends StatelessWidget {
  const QuizHome({ super.key, required this.switchScreen });

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/quiz-logo.png",
          width: 150,
          color: const Color.fromARGB(100, 255, 255, 255),
        ),
        const SizedBox(height: 30,),
        const Text(
          "Learn Flutter With Quiz", 
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        ElevatedButton.icon(
          onPressed: switchScreen, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple.shade100,
          ),
          icon: const Icon(Icons.start),
          label: const Text("Start Quiz", textAlign: TextAlign.center,), 
        ),
      ],
    );
  }
}
