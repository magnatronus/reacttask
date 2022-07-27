

import 'question.dart';
import 'round.dart';

/// A class representing a Activity
/// [activityName] - the name of the activity
/// [order] the order of the activity
/// [rounds] the rounds in the activity
class Activity {

  final String activityName;
  final int order;
  final List <Round> rounds;

  Activity({required this.activityName, required this.order, required this.rounds});

  /// Create Activity from the decoded JSON
  static Activity fromJson(Map<String, dynamic> json){
    return Activity(
      activityName: json['activity_name'],
      order: json['order'],
      rounds: createRounds(json['questions'][0]['round_title'] != null, json['questions']),
    );
  }

  // if not multiround just itertae through questions and return a single round
  static createRounds(bool multiRound, dynamic questions){
    if(!multiRound){
      return [Round(
        questions: questions.map<Question>((question){
          return Question.fromJson(question);
        }).toList()
      )];
    }
    return questions.map<Round>( (round) {
      return Round.fromJson(round);
    }).toList();

  }


}