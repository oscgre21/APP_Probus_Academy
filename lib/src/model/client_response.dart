
import 'package:probusaca/src/Mappers/MapClientResponseObject.dart';
import 'package:probusaca/src/helpers/ijsontobject.dart';
import 'package:probusaca/src/model/ResultObject.dart'; 

class ClientResponse<T extends IResultObject> implements IJsonToObject {
  bool success =false;
  IResultObject resultObject; 
  ClientResponse();
  
  @override
  fromJsonMap<J,K>(Map<dynamic,dynamic> data) { 
      success =  true;// (data['success'] as bool); 
      final MapClientResponseObject filter= MapClientResponseObject.initMapper();
      resultObject= filter.getMapper<T>();
      resultObject.fromJsonMap(data); 
  }
  @override
  fromJsonList<J,K>(List<dynamic> data) { 
      //success =  (data['success'] as bool); 
      final MapClientResponseObject filter= MapClientResponseObject.initMapper();
      resultObject= filter.getMapper<T>();
      resultObject.fromJsonList(data); 
  }
  Map<String, dynamic> toJson()=>{};
}

 
 
