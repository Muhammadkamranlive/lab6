import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QuizBank.dart';
// ignore: implementation_imports
import 'package:flutter/src/material/theme.dart';
import 'Questions.dart';


void main() {
  runApp(MyQuizApp());
}

class MyQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Theme(
        // Create a unique theme with `ThemeData`
        data: ThemeData(
          splashColor: Colors.yellow,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Quizzler'),
            backgroundColor: Colors.deepPurple,
          ),
          body: SafeArea(
            child: MyQuiz(),
          ),
        ),
      ),
    );
  }
}

class MyQuiz extends StatefulWidget {
  
  @override
  _MyQuizState createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  
  //make clas objects with class data type
  QuizBrain obj = QuizBrain();
  List<Widget> scorkeeper = [];

  void compareAnswer(bool answer) {
    bool corretAnswer = obj.CorrectAnswer();
    if (obj.isFinished() == true) {
        obj.reset();
        scorkeeper = [];
    } else {
      if (corretAnswer == answer) {
        scorkeeper.add(
          Icon(Icons.check, color: Colors.green),
        );
      } else {
        scorkeeper.add(
          Icon(Icons.close, color: Colors.red),
        );
      }
      setState(() {
        obj.nextQuestions();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                obj.GetQuestions(),
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                shape: StadiumBorder(),
                onPressed: () {
                  compareAnswer(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.deepPurple,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                  shape: StadiumBorder(),
                  color: Colors.deepPurple,
                  onPressed: () {
                    compareAnswer(false);
                  },
                  child: Text(
                    'False',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: scorkeeper,
          )
        ],
      ),
    );
  }
}
