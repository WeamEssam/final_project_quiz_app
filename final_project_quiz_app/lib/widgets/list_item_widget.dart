import 'package:quiz_app/models/quiz_model.dart';

List<QuizModel> quizList = [
  QuizModel(
      qusNumber: 'Question 1',
      question:
          'How would you describe your level of satisfaction with the healthcare system?',
      choices: [
        'Strongly satisfied',
        'Satisfied',
        'Neutral',
        'Not satisfied',
      ],
      correctAnswer: 'Strongly satisfied'),
  QuizModel(
      qusNumber: 'Question 2',
      question: 'What vitamins do you take?',
      choices: [
        'Vitamin D3',
        'Vitamin B',
        'Zinc',
        'Magnesium',
      ],
      correctAnswer: 'Vitamin D3'),
  QuizModel(
      qusNumber: 'Question 3',
      question: 'What is the recommended daily water intake for adults?',
      choices: [
        '2 cups',
        '4 cups',
        '8 cups',
        '12 cups',
      ],
      correctAnswer: '8 cups'),
  QuizModel(
      qusNumber: 'Question 4',
      question:
          'Which nutrient is responsible for building and repairing body tissues?',
      choices: [
        'Carbohydrates',
        'Proteins',
        'Fats',
        'Vitamins',
      ],
      correctAnswer: 'Proteins'),
  QuizModel(
      qusNumber: 'Question 5',
      question: 'Which of the following is a good source of vitamin C?',
      choices: [
        'Oranges',
        'Eggs',
        'Beef',
        'Whole grains',
      ],
      correctAnswer: 'Oranges'),
];
