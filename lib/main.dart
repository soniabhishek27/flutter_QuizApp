import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions.dart';

import 'quiz_brain.dart';

QuizBrain quizBrain = new QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz App',
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    ));
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {




  List<bool> answere = [false, true, true];

  List<Icon> scoreKeeper = [];


  static int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                 quizBrain.getQuestionText(questionNumber),
              //   quizBrain.questionBank[questionNumber].questiontext,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text(
                    'TRUE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.teal,
                  onPressed: () {
                    setState(() {

                     if(questionNumber < 2)
                       {
                         questionNumber++;

                       }
                     return questionNumber;


                    });


                    //bool correctAnswer = quizBrain.questionBank[questionNumber].answer;

                    bool correctAnswer = quizBrain.getQuestionAnswerTrue(questionNumber);
                    //the above function is declared in quizbrain class this is encapsulation

                    if (correctAnswer == true) {
                      print('sahi jawab');
                    } else {
                      print('wrong');
                    }
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      'FALSE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.red,
                    onPressed: () {
                    //  bool correctAnswer = quizBrain.questionBank[questionNumber].answer;
                    bool correctAnswer = quizBrain.getQuestionAnswerFalse(questionNumber);

                      if (correctAnswer == false) {
                        print('sahi jawab');
                        }
                      else
                        {
                        print('wrong');
                        }
                      setState(() {
                        while(questionNumber!=2)
                        questionNumber++;
                      });
                    },
                  )),
            ),
          ],
        ),
        //Add a ROW here to show the score
        new Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
