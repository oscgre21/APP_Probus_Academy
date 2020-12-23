
import 'package:probusaca/src/helpers/ijsontobject.dart';

class ProfesorViewModel extends IJsonToObject {
    String codigo;
    int codigoEstado;
    String descripcionEstado;
    String nombreProfesor;
    int codigoCarrera;
    String descripcionCarrera;
    String recinto;
    String rol;

    ProfesorViewModel();
 
  
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> data) {  
        codigo=data['codigo'] as String;
        codigoEstado=data['codigo_Estado'] as int;
        descripcionEstado=data['descripcion_Estado'] as String;
        nombreProfesor=data['nombreProfesor'] as String;
        codigoCarrera=data['codigo_Carrera'] as int;  
        descripcionCarrera=data['descripcion_Carrera'] as String;
        recinto=data['recinto'] as String;
        rol=data['rol'] as String; 
        return this;
    }
    Map<String, dynamic> toJson()=>{};
    fromJsonList<J,K>(List<dynamic> data) {  }
}