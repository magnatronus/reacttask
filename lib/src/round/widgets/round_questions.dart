

import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:reacttask/src/question/ui/question_page.dart';


/// This will step through the round questions ten invok ethe next round
class RoundQuestions extends StatelessWidget{
  final List <Question> questions;
  final String title;  
  const RoundQuestions({Key? key, required this.questions, required this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return QuestionPage(questions: questions, title: title, showResultsAtEnd: false);
  }
  
}