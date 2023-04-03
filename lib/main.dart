import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Blue', 'score': 2},
        {'text': 'Green', 'score': 3},
        {'text': 'Purple', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Goat', 'score': 3},
        {'text': 'Pig', 'score': 4},
        {'text': 'Otter', 'score': 2},
        {'text': 'Bear', 'score': 1},
      ]
    },
    {
      'questionText': 'Who\'s your favorite Actor?',
      'answers': [
        {'text': 'Tom Hanks', 'score': 4},
        {'text': 'Tom Hanks', 'score': 4},
        {'text': 'Tom Hanks', 'score': 4},
        {'text': 'Tom Hanks', 'score': 4},
      ]
    },
    {
      'questionText': 'What\'s your favorite Number?',
      'answers': [
        {'text': 1, 'score': 1},
        {'text': 2, 'score': 4},
        {'text': 3, 'score': 3},
        {'text': 4, 'score': 2},
      ]
    },
  ];

  void _answerQuestion(int score) {
    setState(() => _questionIndex = _questionIndex + 1);
    print('Answer Chosen ' + _questionIndex.toString());
    _totalScore += score;
    print('Total Score' + _totalScore.toString());
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Title'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                _answerQuestion,
                _questions,
                _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
