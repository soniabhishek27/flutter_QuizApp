import 'package:flutter_quiz/questions.dart';

class QuizBrain
{

  static int _questionNumber = 0;

  List<Questions>_questionBank = [

    Questions(q:'Java is a Dynamically typed language',a: false),
    Questions(q:'python is a Dynamically typed language',a:true),
    Questions (q:  'Kotlin is offical language for Android Development',a: true),
    Questions (q: 'Flutter is created by Google',a:true),

  ];

  void nextQuestionNumber() {
    if (_questionNumber < _questionBank.length-1)
    {
      _questionNumber++;
    }

  }

  String getQuestionText()
  {
    return _questionBank[_questionNumber].questiontext;

  }
  bool getQuestionAnswer()
  {
    return _questionBank[_questionNumber].answer;

  }

  bool isFinished()
  {
    if(_questionNumber >=_questionBank.length -1 )
      {
        return true;
      }
    else
      {
      return false;
      }
  }

  void reset()
  {
    _questionNumber = 0;

  }



}
