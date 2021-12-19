import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizler/styles/text_style.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(
      const QuizzlerApp(),
    );

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  void _handleIncreaseIndexQuestionList() {
    setState(() {
      quizBrain.getNextQuestion();
    });
  }

  void _handleTrue() {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    if (correctAnswer == true) {
      if (kDebugMode) {
        print('User got right answer');
      }
    } else {
      if (kDebugMode) {
        print('User got wrong answer');
      }
    }

    _handleIncreaseIndexQuestionList();
  }

  void _handleFalse() {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    if (correctAnswer == false) {
      if (kDebugMode) {
        print('User got right answer');
      }
    } else {
      if (kDebugMode) {
        print('User got wrong answer');
      }
    }

    _handleIncreaseIndexQuestionList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: heeboFontStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: _handleTrue,
              child: Text(
                'True',
                style: heeboFontStyle(fontSize: 20.0),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: _handleFalse,
              child: Text(
                'False',
                style: heeboFontStyle(fontSize: 20.0),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
