class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> shuffleAnswer() {
    var answerCopy = List.of(answers);
    answerCopy.shuffle();
    return answerCopy;
  }
}
