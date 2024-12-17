import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/custome_quiz_container.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({
    super.key,
    required this.widget,
  });

  final CustomeQuizContainer widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.quizModel.question,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
