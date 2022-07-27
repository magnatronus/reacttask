
import 'activity.dart';

/// The QuizData class represents the complete API result object
/// [name] is the name of the quiz
/// [heading] more detail on what the quiz is about
/// [activities] the list of activties in the quiz
class QuizData {

  final String name;
  final String heading;
  final List<Activity> activities;

  QuizData({required this.name, required this.heading, required this.activities});

  /// Generate a QuizData object from JSON
  static QuizData fromJson(Map<String, dynamic> json){
    return QuizData(
      name: json['name'], 
      heading: json['heading'], 
      activities: json['activities'].map<Activity>( (activity){
        return Activity.fromJson(activity);
      }).toList()
    );
  }

}