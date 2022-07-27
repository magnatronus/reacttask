import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacttask/src/question/ui/question_page.dart';

import '../../round/round.dart';
import '../app.dart';

class App extends StatelessWidget{
  final Api quizApi;
  const App({Key? key, required this.quizApi}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => AppModel(api:quizApi)..loadQuestions(),
        child: const AppView(),
      ),      
    );
  }
}


class AppView extends StatelessWidget{
  const AppView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppModel>(
        builder: (context, model, child){
          switch(model.status){
            case AppStatus.initial:
            case AppStatus.loading:
              return const Center(
                child: Text("Loading quiz..."),
              );
            case AppStatus.failure:
              return const Center(
                child: Text("There has been an error loading the quiz!"),
              );            
            default:
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("CAE", textAlign: TextAlign.center, style: TextStyle(color: Colors.blue),)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(model.quiz.name, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.blue))
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.activities.length,
                      itemBuilder: (context, idx){
                        return ListTile(
                          title: Center(child: Text(model.activities[idx].activityName, style: const TextStyle(color: Colors.blue))),
                          onTap: (){
                            // if only 1 round show question directly
                            if(model.activities[idx].rounds.length == 1){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => QuestionPage(title: model.activities[idx].activityName, showResultsAtEnd: true,  questions: model.activities[idx].rounds[0].questions)),
                              );                              
                            }
                            // if more than 1 round then start with the round page
                            if(model.activities[idx].rounds.length > 1){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RoundPage(title: model.activities[idx].activityName, rounds: model.activities[idx].rounds)),
                              );                                
                            }                            
                          },
                        );
                      },
                    ),
                  )
                ],
              );
          }
        }
      )
    );
  }
  
}
