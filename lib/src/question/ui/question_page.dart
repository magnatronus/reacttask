

import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacttask/src/question/widgets/current_question_view.dart';
import 'package:reacttask/src/question/widgets/results_view.dart';

import '../question.dart';
import '../widgets/pop_page.dart';

class QuestionPage extends StatelessWidget{
  final List <Question> questions;
  final String title;
  final bool showResultsAtEnd;
  const QuestionPage({Key? key, required this.questions, required this.title, required this.showResultsAtEnd}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
        create: (context) => QuestionModel(questions: questions, title: title, showResultsAtEnd: showResultsAtEnd),
        child: const QuestionView()
      );
  }
}

/// The view used to show the question to the user
class QuestionView extends StatelessWidget{
  const QuestionView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionModel>(
      builder: ((context, model, child) {
        final question = model.nextQuestion;
        switch(model.status){
          case QuestionStatus.returnResults:
            return PopPage(results: model.getResults());
          case QuestionStatus.finished:
            return ResultsView(
              title: model.title,
              results: model.getResults()
            );
          default: 
            return CurrentQuestionView(
              title: model.title,
              question: question.stimulus,
              questionNumber: question.order,
              onTrue: (){
                model.answerQuestion = true;
              },
               onFalse: (){
                model.answerQuestion = false;
              },             
            );
        }

      }),
    );
  }
  
}