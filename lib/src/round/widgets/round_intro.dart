
import 'package:flutter/material.dart';

class RoundIntro extends StatelessWidget{
  final String title;
  final int round;
  final Function() onProceed;
  const RoundIntro({Key? key, required this.title, required this.round, required this.onProceed}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(title, textAlign: TextAlign.left, style: const TextStyle(color: Colors.blue))
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Text("ROUND $round", style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.blue))
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: TextButton(
                  child: const Text("START >>"),
                  onPressed: (){
                    onProceed();
                  },
                )
              )
            ),
            const Text('(this could also be on a timer to auto start)', textAlign: TextAlign.center, style: TextStyle(color: Colors.black12))
          ],
        )
      )
    );    
  }
}