import 'package:flutter/material.dart';
import 'package:quizzler/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(QuizlerApp());
}

class QuizlerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  int total = quizBrain.getQuestionBankLength();
  void checkAnswers(bool userPickedAnswer) {
    bool correctanswer = quizBrain.getQuestionAnswer()!;

    setState(() {
      if (correctanswer == userPickedAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        quizBrain.countScore();
        print('User got it right!');
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
        print('User got it wrong!');
      }
      int score = quizBrain.getScore();

      if (quizBrain.getQuestionNumber() ==
          quizBrain.getQuestionBankLength() - 1) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "QUIZ COMPLETED",
          desc: "Congratulations!\n Your score is $score out of $total.",
          buttons: [
            DialogButton(
              child: Text(
                "Done!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              // onPressed: () => Navigator.pop(context),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  quizBrain.reset();
                  scoreKeeper.clear();
                });
              },
              width: 120,
            ),
          ],
        ).show();
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText()!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                checkAnswers(true);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                checkAnswers(false);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
