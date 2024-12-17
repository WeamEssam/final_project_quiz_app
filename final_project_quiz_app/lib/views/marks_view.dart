import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/views/quiz_view.dart';
import 'package:quiz_app/widgets/list_item_widget.dart';

class MarksView extends StatelessWidget {
  MarksView({super.key});
  static String routeName = 'mark view';
  static int fullMarks = quizList.length;
  final double percentage = ((QuizView.getMarks) / fullMarks * 100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.8,
                  colors: [
                    Color(0xFF24243E),
                    Color(0xFF302B63),
                    Color(0xFF0F0C29),
                  ],
                  stops: [0.1, 0.5, 1.0],
                ),
              ),
              child: CircularPercentIndicator(
                  backgroundColor: Colors.white,
                  radius: 120.0,
                  lineWidth: 20,
                  animation: true,
                  animationDuration: 1000,
                  percent: (QuizView.getMarks) / fullMarks,
                  center: Text(
                    '$percentage %',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  footer: Text(
                    percentage >= 50 ? 'GOOD JOB' : 'TRY AGAIN',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.white),
                  ),
                  progressColor: const Color(0xFFB8B2FF)),
            ),
          )
        ],
      ),
    );
  }
}
