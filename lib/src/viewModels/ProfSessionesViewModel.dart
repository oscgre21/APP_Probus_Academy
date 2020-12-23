
import 'package:probusaca/src/helpers/ijsontobject.dart';

class ProfSessionesViewModel extends IJsonToObject {
    int seccionAsignaturaId;
    int tipoCalificacionPlantillaId;
    String asigCodigo;
    String asigDescripcion;
    String tiSeDescripcion;
    String seccionId;
    DateTime seEnFechaInicia;
    DateTime seEnFechaFinaliza;
    int periodoId;
    String periodoNombre;
    DateTime timeSelected;

   // List<EstudiantesSeccionViewModel> listadoEstudiantesSession;

    ProfSessionesViewModel();
 
  
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> data) {  
        seccionAsignaturaId=data['seccionAsignaturaId'] as int;
        tipoCalificacionPlantillaId=data['tipoCalificacionPlantillaId'] as int;
        asigCodigo=data['asigCodigo'] as String;
        asigDescripcion=data['asigDescripcion'] as String;
        tiSeDescripcion=data['tiSeDescripcion'] as String;  
        seccionId=data['seccionId'] as String;
        seEnFechaInicia= DateTime.parse(data["seEnFechaInicia"]);
        seEnFechaFinaliza=DateTime.parse(data["seEnFechaFinaliza"]);
        periodoId=data['periodoId'] as int;
        periodoNombre=data['periodoNombre'] as String;

       /* var datar=data['listados_estudiantes_Seccion'] as List<dynamic>;   

        listadoEstudiantesSession = new List<EstudiantesSeccionViewModel>.from(datar.map((x) => new EstudiantesSeccionViewModel().fromJsonMap(x)));  */
        return this;
    }
    Map<String, dynamic> toJson()=>{};
    fromJsonList<J,K>(List<dynamic> data) {  }
}