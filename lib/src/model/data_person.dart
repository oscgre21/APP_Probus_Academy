

import 'package:probusaca/src/helpers/ijsontobject.dart';

class DataPerson extends IJsonToObject {
    String nombre;
    String apellido;
    String email;
    String telefono;
    String celular;
    String direccion;
    
    DataPerson();
    /*
    DataPerson({
        this.nombre,
        this.apellido,
        this.email,
        this.telefono,
        this.celular,
        this.direccion,
    });*/
    @override
    fromJsonMap<J,K>(Map<J,dynamic> data) {
        //json['']; 
        nombre=data['nombre'] as String;
        apellido=data['apellido'] as String;
        email=data['email'] as String;
        telefono=data['telefono'] as String;
        celular=data['celular'] as String;
        direccion=data['direccion'] as String; 
    }
    Map<String, dynamic> toJson()=>{};
    fromJsonList<J,K>(List<dynamic> data) { }
}