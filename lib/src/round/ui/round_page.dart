

import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../question/question.dart';
import '../round.dart';
import '../widgets/round_intro.dart';
import '../widgets/round_results.dart';

class RoundPage extends StatelessWidget{
  final List <Round> rounds;
  final String title;
  const RoundPage({Key? key, required this.rounds, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
        create: (context) => RoundModel(rounds: rounds, title: title),
        child: const RoundView()
      );
  }
}


class RoundView extends StatelessWidget{
  const RoundView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Consumer<RoundModel>(
      builder: (context, round, child){
        final currentRound = round.getRound();
        switch(round.status){
          
          case RoundStatus.running:
            return RoundIntro(
              title: round.title, 
              round: currentRound.order, 
              onProceed: () async {
                List <bool> roundResults = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionPage(title: round.title, showResultsAtEnd: false,  questions:currentRound.questions)),
                ); 
                round.saveResults(roundResults);
                round.nextRound();                
              }
            );

          default: 
            return RoundResults(
              title: round.title,
              results: round.results,
            );
        }



      },
    );
  }
  
}