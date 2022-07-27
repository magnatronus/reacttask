

import 'package:api/api.dart';
import 'package:flutter/material.dart';

enum QuestionStatus {unanswered, finished, returnResults}

class QuestionModel extends ChangeNotifier{
  final List<Question> questions;
  List<bool> answers;
  final String title;
  QuestionStatus status = QuestionStatus.unanswered;
  int _currentQuestion = -1;
  final bool showResultsAtEnd;


  QuestionModel({required this.questions, required this.title, required this.showResultsAtEnd}) : answers = List.filled(questions.length, false) ;
  
  /// Whenever this is called it gets the next question
  /// but stops at the last and either show results or indicate the result needs returning
  Question get nextQuestion {
    if(_currentQuestion != questions.length - 1){
      _currentQuestion++;
    } else {
      status = (showResultsAtEnd) ? QuestionStatus.finished : QuestionStatus.returnResults;
    }
    return questions[_currentQuestion];
  }

  /// Add the user answer
  set answerQuestion(bool answer){
    answers[_currentQuestion] = answer;
    notifyListeners();
  }

  /// Get the results of the quiz dervied from user answers
  List <bool> getResults(){
    int index = -1;
    return answers.map( (answer){
      index++;
      return (answer == questions[index].isCorrect);
    }).toList();
  }

  /// get the current question number for display
  int get currentQuestionNumber {
    return (_currentQuestion + 1);
  }

  /// check to see if we are at the last question
  bool get isLastQuestion {
    return _currentQuestion != questions.length - 1;   
  }

}