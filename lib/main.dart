// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_1/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 10},
        {'text': 'Green', 'score': 8},
        {'text': 'White', 'score': 6},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Hamister', 'score': 8},
        {'text': 'Dog', 'score': 10},
        {'text': 'Lion', 'score': 9},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Cat', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s your favorite actor?',
      'answers': [
        {'text': 'Anthony Hopkins', 'score': 9},
        {'text': 'Joaquin Phoenix', 'score': 5},
        {'text': 'Rami Malek', 'score': 10},
        {'text': 'Gary Oldman', 'score': 7},
        {'text': 'Casey Affleck', 'score': 4},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('You are amazing!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore),
      ),
    );
  }
}
