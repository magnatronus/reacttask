
import 'question.dart';

/// A class representing a round of questions
/// [roundTitle] and [order]  are optional as there round may obly consist of 1 set of questions
/// if this is the case the round  defaults to 0
class Round {

  final String? roundTitle;
  final int order;
  final List<Question> questions;

  Round({this.roundTitle, this.order = 0, required this.questions});

  /// Convert Json and detect if single or multi round
  static Round fromJson(Map<String, dynamic> json){
    return Round(
      roundTitle: json['roundTitle'],
      order: json['order'] ?? 0,
      questions: json['questions'].map<Question>( (question) => Question.fromJson(question)).toList() 
    );
  }

 

}