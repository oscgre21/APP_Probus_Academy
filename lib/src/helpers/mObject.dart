

 

import 'package:probusaca/src/helpers/ijsontobject.dart';

class MObject  implements IJsonToObject { 

  fromJsonMap<J,K>(Map<J,dynamic> data) { 
    for (var k in data.keys) {
      print("Key : $k, value : ${data[k]}");
    } 
  }
  Map<String, dynamic> toJson()=>{};

  fromJsonList<J,K>(List<dynamic> data) { 
    /*for (var k in data) {
      print("Key : $k, value : ${k}");
    } */
  }

}