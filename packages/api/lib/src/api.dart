
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/quiz_data.dart';

class GetQuizDataFailure implements Exception {}

class Api {

  static const _url = "s3.eu-west-2.amazonaws.com";
  final http.Client _httpClient;

  Api({http.Client? httpClient}): _httpClient = httpClient ?? http.Client();

  Future <QuizData> getQuiz() async {

    // create request
    final runningRequest = Uri.https(
      _url,
      "/interview.mock.data/payload.json",
    );

    // action request
    final runningResponse = await _httpClient.get(
      runningRequest,
      headers: {
        "Access-Control-Allow-Origin": "*", 
        "Access-Control-Allow-Credentials": 'true',
        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "GET, POST, OPTIONS"    
      }
    );
    if (runningResponse.statusCode != 200) {
      throw GetQuizDataFailure();
    }  

    // decode response
    final quizJson = jsonDecode(
      runningResponse.body,
    ); 

    final result = QuizData.fromJson(quizJson);
    return result; 

  }


}