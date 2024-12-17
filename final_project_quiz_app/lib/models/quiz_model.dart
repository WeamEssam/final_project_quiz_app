class QuizModel {
  final String qusNumber;
  final String question;
  final List<String> choices;
  final String correctAnswer;

  QuizModel({
    required this.qusNumber,
    required this.question,
    required this.choices,
    required this.correctAnswer,
  });
}
