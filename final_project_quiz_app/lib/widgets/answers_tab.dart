import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/list_item_widget.dart';

class AnswersTab extends StatelessWidget {
  const AnswersTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Correct Answers ',
          style: TextStyle(
            color: Color(0xFF302B63),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center, // مركز التدريج
                radius: 0.8, // مدى الانتشار
                colors: [
                  Color(0xFF24243E), // لون خارجي
                  Color(0xFF302B63), // لون متوسط
                  Color(0xFF0F0C29), // لون داخلي
                ],
                stops: [0.1, 0.5, 1.0], // نقاط التوقف للألوان
              ),
            ),
            child: ListView.builder(
              itemCount: quizList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "${index + 1} - ${quizList[index].correctAnswer}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
