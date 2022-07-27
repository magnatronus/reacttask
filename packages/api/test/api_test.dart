
import 'package:flutter_test/flutter_test.dart';
import 'package:api/api.dart';


final api = Api();

void main() async{

 
    final result = await api.getQuiz();
    print(result);

}