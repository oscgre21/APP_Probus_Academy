 

import 'package:probusaca/src/model/data_person.dart';

class Session {
    static Session _singleton;

    String token="";
    String matricula="";

    factory Session(){
      if (_singleton==null){
          _singleton=Session._internal();
      }
      return _singleton;
    } 
 
    Session._internal();  

}
