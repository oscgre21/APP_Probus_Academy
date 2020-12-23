
import 'package:probusaca/src/helpers/ijsontobject.dart';

class AsignaturaViewModel extends IJsonToObject {
    int idseccion;
    String codigo;
    String asignatura;
    String seccion;
    int cr;

    AsignaturaViewModel();
  
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> data) {   
        idseccion=data['idseccion'] as int;
        codigo=data['codigo'] as String;
        asignatura=data['asignatura'] as String;
        seccion=data['seccion'] as String;
        cr=data['cr'] as int;  
        return this;
    }
    Map<String, dynamic> toJson()=>{};
    fromJsonList<J,K>(List<dynamic> data) {  }
}