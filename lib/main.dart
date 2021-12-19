import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizler/styles/text_style.dart';
import 'question.dart';

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

  final List<Question> _listQuestion = [
    Question(q: 'You can lead a cow down stairs but not to upstairs', a: false),
    Question(
      q: 'Approximately one quarter of human bones are inthe feet',
      a: true,
    ),
    Question(q: 'A slug\'s blood is green', a: true),
  ];

  int _questionNumber = 0;

  void _handleIncreaseIndexQuestionList() {
    setState(() {
      if (_questionNumber == (_listQuestion.length - 1)) {
        _questionNumber = 0;
      } else {
        _questionNumber++;
      }
    });
  }

  void _handleTrue() {
    bool correctAnswer = _listQuestion[_questionNumber].questionAnswer;

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
    bool correctAnswer = _listQuestion[_questionNumber].questionAnswer;

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
                _listQuestion[_questionNumber].questionText,
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
