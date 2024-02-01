import "package:quiz_app/data/questions.dart";

Map<String, Object> generateSummary(List<String> userAnswers) {
  List<Map<String, String>> responseSummary = [];
  int totalCorrect = 0;
  for(int i = 0; i < questions.length; i++) {
    final currQuestion = questions[i];
    Map<String, String> eachSummary = {
      "questionNo": (i + 1).toString(),
      "question": currQuestion.question,
      "answer": currQuestion.answers[0],
      "userAnswer": userAnswers[i]
    };

    if(currQuestion.answers[0] == userAnswers[i]) {
      totalCorrect++;
    }

    responseSummary.add(eachSummary);
  }

  Map<String, Object> response = {};
  response["quizSummary"] = responseSummary;
  response["totalCorrect"] = totalCorrect;
  

  return response;
}
