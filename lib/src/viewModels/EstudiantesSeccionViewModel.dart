
import 'package:probusaca/src/helpers/ijsontobject.dart';

class EstudiantesSeccionViewModel extends IJsonToObject {
 
    String matricula;
    String nombres; 
    String apellidos;
    String carrera; 

    EstudiantesSeccionViewModel();
 
  
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> data) {  
        matricula=data['matricula'] as String;
        nombres=data['nombres'] as String;
        apellidos=data['apellidos'] as String;
        carrera=data['carrera'] as String;  
        
        return this;
    }
    Map<String, dynamic> toJson()=>{};
    fromJsonList<J,K>(List<dynamic> data) {  }
}