import 'package:flutter/material.dart';
import 'package:quiz_app/views/home_view.dart';
import 'package:quiz_app/views/marks_view.dart';
import 'package:quiz_app/widgets/back_button.dart';
import 'package:quiz_app/widgets/custome_next_button.dart';
import 'package:quiz_app/widgets/list_item_widget.dart';

class ButtonsSection extends StatefulWidget {
  const ButtonsSection({
    super.key,
    required this.pageController,
    required this.pageIndex,
  });

  final PageController pageController;
  final int pageIndex;

  @override
  State<ButtonsSection> createState() => _ButtonsSectionState();
}

class _ButtonsSectionState extends State<ButtonsSection> {
  late int currentPage;
  @override
  void initState() {
    super.initState();
    currentPage = widget.pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 55),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                if (currentPage == 0) {
                  Navigator.pushNamed(context, HomeView.routeName);
                } else {
                  currentPage--;
                  widget.pageController.animateToPage(currentPage,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn);
                }
              },
              child: const CustomeBackButton(),
            ),
            GestureDetector(
              onTap: () {
                if (currentPage == quizList.length - 1) {
                  Navigator.pushNamed(context, MarksView.routeName);
                } else {
                  currentPage++;
                  widget.pageController.animateToPage(currentPage,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn);
                }
              },
              child: const CustomeNextButton(),
            ),
          ],
        ),
      ),
    );
  }
}
