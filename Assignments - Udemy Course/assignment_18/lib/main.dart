import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  return runApp(HafeezMainHomeApp());
}

class HafeezMainHomeApp extends StatefulWidget {
  @override
  HafeezPageBody createState() => HafeezPageBody();
}

class HafeezPageBody extends State<HafeezMainHomeApp> {

  List<Icon> iconsMyList = [];
  List <String>myQuestions = [
    'Some cats are actually allergic to humans',
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    'It is illegal to pee in the Ocean in Portugal.'
  ];

  List <bool>myQuestionsAnswer = [true, false, true, true, false];
  var readQuestionNumber = 0;

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
                          myQuestions[readQuestionNumber],
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
                            if(myQuestionsAnswer[readQuestionNumber]){
                                iconsMyList.add(Icon(Icons.check, color: Colors.green));
                            }
                            else {
                              iconsMyList.add(Icon(Icons.close, color: Colors.red));
                            }

                            if(myQuestions.length == readQuestionNumber+1){
                              print('You\'ve reached the end of the quiz.');
                              readQuestionNumber = 0;
                              iconsMyList = [];
                            }
                            else { readQuestionNumber++; }
                          });

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
                            if(myQuestionsAnswer[readQuestionNumber]){
                              iconsMyList.add(Icon(Icons.check, color: Colors.green));
                            }
                            else {
                              iconsMyList.add(Icon(Icons.close, color: Colors.red));
                            }

                            if(myQuestions.length == readQuestionNumber+1){
                              print('You\'ve reached the end of the quiz.');
                              readQuestionNumber = 0;
                              iconsMyList = [];
                            }
                            else { readQuestionNumber++; }

                          });
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
