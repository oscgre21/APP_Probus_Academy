
import 'package:probusaca/src/helpers/ijsontobject.dart';

class HorarioProfesorViewModel extends IJsonToObject {
    String horaDesde; 
    String horaHasta;
    String recinto;  

    HorarioProfesorViewModel();
 
  
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> data) {  
        horaDesde=data['hora_Desde'] as String;
        horaHasta=data['hora_Hasta'] as String;
        recinto=data['recinto'] as String; 
        return this;
    }
    Map<String, dynamic> toJson()=>{};
    fromJsonList<J,K>(List<dynamic> data) {  }
}