import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/answers_tab.dart';
import 'package:quiz_app/widgets/button_section.dart';
import 'package:quiz_app/widgets/custome_quiz_container.dart';
import 'package:quiz_app/widgets/list_item_widget.dart';

class QuizView extends StatefulWidget {
  QuizView({super.key});
  static String routeName = 'quiz view';
  static int getMarks = 0;
  final PageController pageController = PageController();

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  int totalScore = 0;
  int pageIndex = 0;

  void updateScore(int score) {
    setState(() {
      totalScore += score;
      QuizView.getMarks = totalScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF8E84FF),
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: [
              Icon(Icons.quiz_rounded),
              Icon(Icons.question_answer_rounded)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
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
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: widget.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: quizList.length,
                      itemBuilder: (BuildContext context, int index) {
                        pageIndex = index;
                        return CustomeQuizContainer(
                          pageIndex: pageIndex,
                          quizModel: quizList[index],
                          onScoreUpdated: updateScore,
                        );
                      },
                    ),
                  ),
                  ButtonSection(pageIndex: pageIndex, quizViewWidget: widget)
                ],
              ),
            ),
            const AnswersTab()
          ],
        ),
      ),
    );
  }
}








//// instead of ButtonSection

 // Padding(
                //   padding: const EdgeInsets.only(bottom: 30),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           if (pageIndex == 0) {
                //             Navigator.pushNamed(context, HomeView.routeName);
                //           } else {
                //             pageIndex--;
                //             pageController.animateToPage(pageIndex,
                //                 duration: const Duration(milliseconds: 600),
                //                 curve: Curves.easeIn);
                //           }
                //         },
                //         child: const CustomeBackButton(),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           if (pageIndex == quizList.length - 1) {
                //             Navigator.pushNamed(context, MarksView.routeName);
                //           } else {
                //             pageIndex++;
                //             pageController.animateToPage(pageIndex,
                //                 duration: const Duration(milliseconds: 600),
                //                 curve: Curves.easeIn);
                //           }
                //         },
                //         child: const CustomeNextButton(),
                //       ),
                //     ],
                //   ),
                // )