import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/custome_quiz_container.dart';

class QuestionNumber extends StatelessWidget {
  const QuestionNumber({
    super.key,
    required this.widget,
  });

  final CustomeQuizContainer widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.quizModel.qusNumber,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        //   height: 0,
      ),
    );
  }
}
