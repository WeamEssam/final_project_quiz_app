// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/views/home_view.dart';
import 'package:quiz_app/views/marks_view.dart';
import 'package:quiz_app/views/quiz_view.dart';
import 'package:quiz_app/widgets/back_button.dart';
import 'package:quiz_app/widgets/custome_next_button.dart';
import 'package:quiz_app/widgets/list_item_widget.dart';

class ButtonSection extends StatefulWidget {
  ButtonSection({
    super.key,
    required this.pageIndex,
    required this.quizViewWidget,
  });
  int pageIndex;
  final QuizView quizViewWidget;
  @override
  State<ButtonSection> createState() => _ButtonSectionState();
}

class _ButtonSectionState extends State<ButtonSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              if (widget.pageIndex == 0) {
                Navigator.pushNamed(context, HomeView.routeName);
              } else {
                widget.pageIndex--;
                widget.quizViewWidget.pageController.animateToPage(
                    widget.pageIndex,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeIn);
              }
            },
            child: const CustomeBackButton(),
          ),
          GestureDetector(
            onTap: () {
              if (widget.pageIndex == quizList.length - 1) {
                Navigator.pushNamed(context, MarksView.routeName);
              } else {
                widget.pageIndex++;
                widget.quizViewWidget.pageController.animateToPage(
                    widget.pageIndex,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeIn);
              }
            },
            child: const CustomeNextButton(),
          ),
        ],
      ),
    );
  }
}
