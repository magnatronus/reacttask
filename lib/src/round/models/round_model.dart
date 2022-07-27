

import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:reacttask/src/round/models/round_result.dart';

enum RoundStatus {running, finished}

class RoundModel extends ChangeNotifier{
  final List<Round> rounds;
  final List<RoundResult> results;
  final String title;
  RoundStatus status = RoundStatus.running;
  int currentRound = -1;

  RoundModel({required this.rounds, required this.title}) : results = List.filled(rounds.length, RoundResult());
  
  /// Get the current round
  Round getRound(){
    if(currentRound !=  rounds.length -1){
      currentRound++;
    }
    return rounds[currentRound];
  }

  /// Save the results of the sepcified round
  void saveResults(List <bool> roundResult){
    results[currentRound].results = roundResult;
  }

  ///  Check if next round OR finished
  nextRound(){
    if(currentRound >= rounds.length -1){
      status = RoundStatus.finished;
    }
    notifyListeners();
  }


}