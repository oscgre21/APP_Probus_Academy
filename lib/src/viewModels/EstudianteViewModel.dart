
import 'package:probusaca/src/helpers/ijsontobject.dart';

class EstudianteViewModel extends IJsonToObject {
    String matricula;
    String estudianteNombres;
    String carrera;
    String planEstudio;
    int periodoAdmision; 
    
    EstudianteViewModel();
 
  
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> data) {  
        matricula=data['matricula'] as String;
        estudianteNombres=data['estudianteNombres'] as String;
        carrera=data['carrera'] as String;
        planEstudio=data['planEstudio'] as String;
        periodoAdmision=data['periodoAdmision'] as int;  
        return this;
    }
    Map<String, dynamic> toJson()=>{};
    fromJsonList<J,K>(List<dynamic> data) {  }
}