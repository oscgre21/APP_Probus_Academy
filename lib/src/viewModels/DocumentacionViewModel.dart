
import 'package:probusaca/src/helpers/ijsontobject.dart';

class DocumentacionViewModel extends IJsonToObject {
    int campus;
    int carreraEstudiante;
    int documentoId;
    String matricula;
    String nombres;
    String apellidos;
    String carreraNombre;
    String entregado; 
    String documentoDescripcion;
    int campusDo;
    DocumentacionViewModel();
  
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> data) {   
        campus=data['campus'] as int;
        carreraEstudiante=data['carreraEstudiante'] as int;
        documentoId=data['documentoId'] as int;
        nombres=data['nombres'] as String;
        apellidos=data['apellidos'] as String;
        carreraNombre=data['carreraNombre'] as String;
        matricula=data['matricula'] as String; 
        entregado=(data['entregado'] as bool)?'Si':'No'; 
        campusDo=data['campusDo'] as int;  
        documentoDescripcion=data['documentoDescripcion'] as String;
        print(carreraNombre);
        return this;
    }
    Map<String, dynamic> toJson()=>{};
    fromJsonList<J,K>(List<dynamic> data) {  }
}