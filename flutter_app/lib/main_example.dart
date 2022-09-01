import 'package:flutter/material.dart';

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
    /*{
      'questionText': 'Date',
      'answers': ['Today']
    },
    {
      'questionText': 'Full name',
      'answers': ['Black']
    },
    {
      'questionText': 'Company or person visiting',
      'answers': ['Black']
    },
    {
      'questionText': 'People you traveled with',
      'answers': ['Black']
    },
    {
      'questionText': 'Contact Number',
      'answers': ['Black']
    },
    {
      'questionText': 'Time in - time out',
      'answers': ['Black']
    }*/

    {
      'questionText': 'Arrived into NZ within the past 14 days',
      'answers': ['Yes', 'No']
    },
    {
      'questionText': 'been in contact with someone with COVID-19 symptoms',
      'answers': ['Yes', 'No']
    },
    {
      'questionText': 'had any COVID-19 symptoms',
      'answers': ['Yes', 'No']
    }
  ];

  int _questionIndex = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
    });
  }

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('You have another question');
    } else {
      print('No more questions left');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Sign-in Register'),
            //Contact tracing information
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions)
              : Result(_resetQuiz)),
    );
  }
}
