import 'package:flutter/material.dart';
import 'package:quiz_app/views/home_view.dart';
import 'package:quiz_app/views/marks_view.dart';
import 'package:quiz_app/views/quiz_view.dart';
import 'package:quiz_app/views/sign_in_view.dart';
import 'package:quiz_app/views/sign_up_view.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        QuizView.routeName: (context) => QuizView(),
        HomeView.routeName: (context) => const HomeView(),
        MarksView.routeName: (context) => MarksView(),
        SignInView.routeName: (context) => const SignInView(),
        SignUpView.routeName: (context) => const SignUpView(),
      },
      home: const SignInView(),
    );
  }
}
