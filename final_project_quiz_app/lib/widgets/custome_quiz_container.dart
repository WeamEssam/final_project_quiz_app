import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_model.dart';
import 'package:quiz_app/widgets/button_section.dart';
import 'package:quiz_app/widgets/custom_answer_box.dart';
import 'package:quiz_app/widgets/header_section.dart';
import 'package:quiz_app/widgets/question_text.dart';

class CustomeQuizContainer extends StatefulWidget {
  const CustomeQuizContainer({
    super.key,
    required this.quizModel,
    required this.pageIndex,
    required this.pageController,
    required this.onScoreUpdated,
  });
  final QuizModel quizModel;
  final PageController pageController;
  final int pageIndex;
  final Function(int) onScoreUpdated;

  @override
  State<CustomeQuizContainer> createState() => _CustomeQuizContainerState();
}

class _CustomeQuizContainerState extends State<CustomeQuizContainer>
    with AutomaticKeepAliveClientMixin {
  String? selectedAnswer;
  int score = 0;

  void checkAnswer() {
    if (selectedAnswer == widget.quizModel.correctAnswer) {
      score++;
      widget.onScoreUpdated(score);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(top: 32, right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: ShapeDecoration(
              color: const Color(0xFF8D83FF),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFB8B2FF)),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: HeaderSection(widget: widget),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                QuestionText(widget: widget),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.quizModel.choices.length,
                itemBuilder: (context, index) {
                  return ChoiceBox(
                    textAnswer: widget.quizModel.choices[index],
                    onSelected: (String? newvalue) {
                      setState(() {
                        selectedAnswer = newvalue!;
                        checkAnswer();
                        log(score.toString());
                      });
                    },
                    selectedAnswer: selectedAnswer,
                  );
                }),
          ),
          ButtonsSection(
            pageController: widget.pageController,
            pageIndex: widget.pageIndex,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
