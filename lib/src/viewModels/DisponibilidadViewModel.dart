
import 'package:probusaca/src/helpers/ijsontobject.dart';

class DisponibilidadViewModel extends IJsonToObject {
    String codigo;
    String asignatura;
    String recinto;
    int codigoRecinto;

    DisponibilidadViewModel();
 
  
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> data) {  
        codigo=data['codigo'] as String;
        asignatura=data['asignatura'] as String;
        recinto=data['recinto'] as String; 
        codigoRecinto=data['codigo_Recinto'] as int;   
        return this;
    }
    Map<String, dynamic> toJson()=>{};
    fromJsonList<J,K>(List<dynamic> data) {  }
}