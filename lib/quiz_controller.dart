import 'question.dart';
import 'package:flutter/material.dart';

class QuizController {
  int questionNumber;
  List<Icon> scoreKeeper = [];
  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  String getQuestion(int questionIndex) {
    if (questionIndex < _questionBank.length - 1) {
      return _questionBank[questionIndex].questionText;
    } else {
      questionIndex = 0;
      return 'You\'ve completed the game! \n Long press on TRUE to play again.';
    }
  }

  bool getAnswer(int answerIndex) {
    return _questionBank[answerIndex].questionAnswer;
  }

  void giveScore(bool answeredStatus) {
    if (answeredStatus)
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    else
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
  }

  void checkAnswer(bool userAnswer, int questionIndex) {
    //checking to see if it's the first question then clear the score board

    //if (questionIndex == 0)
    questionNumber = questionIndex;
    //checking to see if there is available question
    if (questionNumber < _questionBank.length - 1) {
      if (questionNumber == 0) scoreKeeper.clear();
      if (userAnswer == _questionBank[questionNumber].questionAnswer)
        giveScore(true);
      else
        giveScore(false);

      questionNumber++;
    } else if (questionNumber == _questionBank.length - 1) {
      giveScore(userAnswer);
      questionNumber = 0;
    }
  }

  List getScore() {
    return scoreKeeper;
  }

  void adjustQuestionIndex(int newNumber) {
    questionNumber = newNumber;
  }
}
