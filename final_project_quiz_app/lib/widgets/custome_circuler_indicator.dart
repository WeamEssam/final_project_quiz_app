import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/custome_quiz_container.dart';
import 'package:quiz_app/widgets/list_item_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CustomeCirculerStepsIndicator extends StatelessWidget {
  const CustomeCirculerStepsIndicator({
    super.key,
    required this.widget,
  });

  final CustomeQuizContainer widget; // to access page index

  @override
  Widget build(BuildContext context) {
    return CircularStepProgressIndicator(
      totalSteps: quizList.length,
      currentStep: widget.pageIndex + 1,
      stepSize: 2,
      selectedColor: const Color(0xFF2B0063),
      unselectedColor: Colors.grey,
      width: 15,
      height: 15,
    );
  }
}
