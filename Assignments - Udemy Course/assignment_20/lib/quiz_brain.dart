import 'question.dart';
class QuizBrain {

  var readQuestionNumber = 0;

  List<Question> myQuestionsList = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
  ];

  void nextQuestion() {
    if (readQuestionNumber < myQuestionsList.length - 1) {
      readQuestionNumber++;
    }
  }

  String getQuestionText() {
    return myQuestionsList[readQuestionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return myQuestionsList[readQuestionNumber].questionAnswer;
  }

  bool isFinished() {
    if (readQuestionNumber >= myQuestionsList.length - 1) {
      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    readQuestionNumber = 0;
  }

}