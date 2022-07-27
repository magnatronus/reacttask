
/// A simple class representing a question object
/// [isCorrect] whether the phrase presented is correct
/// [stimulus] the phrase the user is required to identify if correct
/// [feedback] the correct version of the phrase
/// [order] the order of the question in the question list
class Question {

  final bool isCorrect;
  final String stimulus;
  final String feedback;
  final int order;

  Question({required this.isCorrect, required this.stimulus, required this.feedback, required this.order});

  /// Generate a Question object from json
  static Question fromJson(Map<String, dynamic> json){
    return Question(
      isCorrect: json['is_correct'], 
      stimulus: json['stimulus'], 
      feedback: json['feedback'], 
      order: json['order'],

    );
  }
} 