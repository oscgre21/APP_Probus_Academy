
import 'package:probusaca/src/helpers/ijsontobject.dart';

class HistoricoNotasViewModel extends IJsonToObject {
    String periodo;
    String carrera;
    String asignatura;
    int creditos;
    double totalNota;
    String literal;

    HistoricoNotasViewModel();
  
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> data) {   
        periodo=data['periodo'] as String;
        carrera=data['carrera'] as String;
        asignatura=data['asignatura'] as String;
        creditos=data['creditos'] as int;
        totalNota=(data['totalNota'] as double);  
        literal=data['literal'] as String;  
        return this;
    }
    Map<String, dynamic> toJson()=>{};
    fromJsonList<J,K>(List<dynamic> data) {  }
}