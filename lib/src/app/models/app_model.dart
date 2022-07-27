

import 'package:api/api.dart';
import 'package:flutter/material.dart';

enum AppStatus {initial, loading, success, failure}

/// App Model that takes care of retrieving the test set of questions
class AppModel extends ChangeNotifier {
  
  final Api api;
  AppStatus status = AppStatus.initial;
  late QuizData quiz;

  AppModel({required this.api});

  List <Activity> get activities {
    return quiz.activities;
  }


  /// Here we load the quiz data and sort the activities
  Future<void> loadQuestions() async {

    // indicate we are loading
    status = AppStatus.loading;
    notifyListeners();

    // retrieve the data
    try{
      quiz = await api.getQuiz();
      quiz.activities.sort((a,b) => a.order.compareTo(b.order));
      status = AppStatus.success;
    }catch(e){
      print(e);
      status = AppStatus.failure;
    }

    // indicat the result
    notifyListeners();
  }


}