import 'package:api/api.dart';
import 'package:flutter/material.dart';

import 'src/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  final quizApi = Api();
  runApp(App(quizApi: quizApi));
}



