import 'package:flutter/material.dart';
import 'package:reacttask/src/widgets/border_panel.dart';
import 'package:simple_rich_text/simple_rich_text.dart';

/// The view used to display a question
class CurrentQuestionView extends StatelessWidget{
  final String title;
  final String question;
  final int questionNumber;
  final Function() onTrue;
  final Function() onFalse;
  const CurrentQuestionView({Key? key, required this.title, required this.question, required this.questionNumber, required this.onTrue, required this.onFalse}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(title.toUpperCase(), style: const TextStyle(color: Colors.blue))
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Text("Q$questionNumber.", style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.blue))
            ),

            BorderPanel(
              padding: 32,
              child: SimpleRichText(question, style: const TextStyle(color: Colors.blue),)
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: onTrue, 
                    child: Text("CORRECT",  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.blue)),
                  ),
                  TextButton(
                    onPressed: onFalse, 
                    child: Text("INCORRECT" ,  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.blue)),
                  ),                  
                ],
              ),
            )

          ],
        )
      )
    );    
  }
}