import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


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

  List<bool> answer = [false, true, true];

  List<Icon> scoreKeeper = [


  ];



  void checkAnswer(bool userPickedAnswer)
  {

    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(()
    {

      if(quizBrain.isFinished()==true)
      {
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You have reached end of the quiz',
        ).show();

        quizBrain.reset();

        scoreKeeper = [];
      }
      else {
        if (userPickedAnswer == correctAnswer) {
          //print('sahi jawab');
          scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
        } else {
          //print('wrong');
          scoreKeeper.add(Icon(Icons.close, color: Colors.red,
          ));
        }
      }

      quizBrain.nextQuestionNumber();
    });

  }




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
                 quizBrain.getQuestionText(),
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

                    checkAnswer(true);

                    //bool correctAnswer = quizBrain.questionBank[questionNumber].answer;

                    //the above function is declared in quizbrain class this is encapsulation
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

                      checkAnswer(false);


                    //  bool correctAnswer = quizBrain.questionBank[questionNumber].answer;

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
