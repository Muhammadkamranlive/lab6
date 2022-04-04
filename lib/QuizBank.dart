// ignore: file_names
import 'Questions.dart';
class QuizBrain{
  // ignore: non_constant_identifier_names
  //ecan
  int _QuestionNumber=0;
  //
  final List <Questions> _questionBank=[
    Questions('questionn 1', false),
    Questions('questionn 2', true),
    Questions('question  3', true),
    Questions('question  4', true),
    Questions('question  5', false),
    Questions('question  6', false),
    Questions('question  7', true),
    Questions('question  8', true),
    Questions('question  9', true),
    Questions('question  10', false),
  ];

  //ignore:
   void nextQuestions(){
       if(_QuestionNumber<_questionBank.length-1){
          _QuestionNumber++;
       }
   }

  // ignore: non_constant_identifier_names
  String GetQuestions(){
    return _questionBank[_QuestionNumber].QuestionString;
  }

  // ignore: non_constant_identifier_names
  bool CorrectAnswer(){
      return _questionBank[_QuestionNumber].AnswerText;
  }

  bool isFinished() {
    if (_QuestionNumber >=_questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }


  void reset() {
    _QuestionNumber = 0;
  }

}