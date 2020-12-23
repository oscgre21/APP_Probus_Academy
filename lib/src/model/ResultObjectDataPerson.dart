import 'package:probusaca/src/helpers/ijsontobject.dart';
import 'package:probusaca/src/model/ResultObject.dart'; 
class ResultObjectDataPerson  implements IResultObject  {
    String token; 
    String rol;
    String nombres;
    String apellidos;

    ResultObjectDataPerson(); 

    @override
    fromJsonMap<J,K>(Map<J,dynamic> data) { 
        rol=data['rol'] as String;    
        nombres=data['nombres'] as String;    
        apellidos=data['apellidos'] as String; 
        return this;   
    }
    Map<String, dynamic> toJson()=>{};
    fromJsonList<J,K>(List<dynamic> data) {  }
}