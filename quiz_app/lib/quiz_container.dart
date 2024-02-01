import "package:flutter/material.dart";
import "package:quiz_app/quiz_home.dart";
import "package:quiz_app/quiz.dart";
import "package:quiz_app/data/questions.dart";
import "package:quiz_app/utils/utils.dart";
import "package:quiz_app/quiz_response.dart";

class QuizContainer extends StatefulWidget {
  const QuizContainer({super.key});

  @override
  State<QuizContainer> createState() => _QuizContainer();
}

class _QuizContainer extends State<QuizContainer> {
  Widget? activeScreen;
  final List<String> userAnswers = [];
  
  @override
  void initState() {
    activeScreen = QuizHome(switchScreen: switchScreen,);
    super.initState();
  }

  void restartQuiz() {
    setState(() {
      userAnswers.clear();
      activeScreen = QuizHome(switchScreen: switchScreen,);
    });
  }

  void switchScreen () {
    setState(() {
      activeScreen = Quiz(storeUserAnswer: storeUserAnswer,);
    });
  }

  void storeUserAnswer(String answer) {
    userAnswers.add(answer);
    if(userAnswers.length == questions.length) {
      setState(() {
        Map<String, Object> summary = generateSummary(userAnswers);
        activeScreen = QuizResponse(quizSummary: summary, restartQuiz: restartQuiz,);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: Center(
        child: activeScreen,
      ),
    );
  }
}


