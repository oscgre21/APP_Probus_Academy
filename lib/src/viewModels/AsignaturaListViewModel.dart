
import 'package:probusaca/src/helpers/ijsontobject.dart';

class AsignaturaListViewModel extends IJsonToObject {
    bool asistencia;
    bool retirado;
    String carrAlias;
    String carrDescripcion;
    int carreraId;
    int estudianteId;
    String matriculaId;
    String nombreCompleto;

    AsignaturaListViewModel();
  
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> data) {   
        asistencia=data['asistencia'] as bool;
        retirado=data['retirado'] as bool;
        carrAlias=data['carrAlias'] as String;
        carrDescripcion=data['carrDescripcion'] as String;
        carreraId=data['carreraId'] as int;  
        estudianteId=data['estudianteId'] as int;  
        matriculaId= data['matriculaId'] as String;
        nombreCompleto= data['nombreCompleto'] as String;
        return this;
    }
    Map<String, dynamic> toJson(){
        var data={
            "asistencia": asistencia,
            "retirado": retirado,
            "carrAlias": carrAlias,
            "carrDescripcion": carrDescripcion,
            "carreraId": carreraId,
            "estudianteId": estudianteId,
            "matriculaId": matriculaId,
            "nombreCompleto": nombreCompleto
        };
        return data;
    }
    fromJsonList<J,K>(List<dynamic> data) {  }
}