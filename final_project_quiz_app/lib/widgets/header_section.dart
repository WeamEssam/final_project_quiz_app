import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/custome_circuler_indicator.dart';
import 'package:quiz_app/widgets/custome_quiz_container.dart';
import 'package:quiz_app/widgets/question_number.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.widget,
  });

  final CustomeQuizContainer widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomeCirculerStepsIndicator(widget: widget),
        const SizedBox(
          width: 5,
        ),
        QuestionNumber(widget: widget),
      ],
    );
  }
}
