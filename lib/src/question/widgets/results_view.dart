
import 'package:flutter/material.dart';

class ResultsView extends StatelessWidget{
  final String title;
  final List<bool> results;
  const ResultsView({Key? key, required this.title, required this.results}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(title.toUpperCase(), style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.blue, fontWeight: FontWeight.bold))
            ),

            Padding(
              padding: const EdgeInsets.all(16),              
              child: Text("Results", textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.blue))
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left:32, right:32),
                child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.only(left:32, right:32, top: 8, bottom: 8),             
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Q${index+1}", style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.blue)),
                        Text((results[index]) ? "CORRECT" : "FALSE",  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.blue, fontWeight: FontWeight.bold)),
                      ]
                    ),
                  );
                }
              )),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                child: Text("HOME", style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.blue)),
                onPressed: (){
                  Navigator.pop(context);
                }
              )
            ),

          ],
        ),
      )
    );
  }
  
}