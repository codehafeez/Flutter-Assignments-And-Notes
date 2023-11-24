import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  return runApp(HafeezMainHomeApp());
}

class HafeezMainHomeApp extends StatefulWidget {
  @override
  HafeezPageBody createState() => HafeezPageBody();
}

class HafeezPageBody extends State<HafeezMainHomeApp> {

  List<Icon> iconsMyList = [];

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.teal,

            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          quizBrain.getQuestionText(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text(
                          "True",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if(quizBrain.getCorrectAnswer()){
                              iconsMyList.add(Icon(Icons.check, color: Colors.green));
                            }
                            else {
                              iconsMyList.add(Icon(Icons.close, color: Colors.red));
                            }
                          });

                          if (quizBrain.isFinished() == true) {
                            quizBrain.reset();
                            iconsMyList = [];
                          }
                          else { quizBrain.nextQuestion(); }
                        },
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.red,
                        child: Text(
                          "False",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if(quizBrain.getCorrectAnswer()){
                              iconsMyList.add(Icon(Icons.check, color: Colors.green));
                            }
                            else {
                              iconsMyList.add(Icon(Icons.close, color: Colors.red));
                            }
                          });

                          if (quizBrain.isFinished() == true) {
                            quizBrain.reset();
                            iconsMyList = [];
                          }
                          else { quizBrain.nextQuestion(); }
                        },
                      ),
                    ),
                  ),

                  Row(children: iconsMyList),

                ],
              ),
            ),
          )
      );
  }
}
