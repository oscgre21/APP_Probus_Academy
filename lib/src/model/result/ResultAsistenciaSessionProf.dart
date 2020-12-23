import 'package:probusaca/src/model/ResultObject.dart';
import 'package:probusaca/src/viewModels/AsignaturaListViewModel.dart'; 
 

class ResultAsistenciaSessionProf implements IResultObject{ 
    List<AsignaturaListViewModel>  result;  
    int periodoAcademicoId=0;
    int total;
    ResultAsistenciaSessionProf(); 
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> json) {  
       var data=json['estudiantes'] as List<dynamic>;  

       if (json['id_Asistencia_Enc']!=null){ 
          periodoAcademicoId= json['id_Asistencia_Enc'] as int;
       }
      // var asistencia=json['id_Asistencia_Enc'] as int; 
       total=data.length;
       result = new List<AsignaturaListViewModel>.from(data.map((x) => AsignaturaListViewModel().fromJsonMap(x)));  
    }
    @override
    fromJsonList<J,K>(List<dynamic> json) {  
       total=json.length;   
       result = new List<AsignaturaListViewModel>.from(json.map((x)=>AsignaturaListViewModel().fromJsonMap(x) ));  
    }
    Map<String, dynamic> toJson()=>{};
  
}