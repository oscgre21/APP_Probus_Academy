import 'package:probusaca/src/model/ResultObject.dart';
import 'package:probusaca/src/viewModels/AsignaturaViewModel.dart'; 
 
 

class ResultHorario implements IResultObject{ 
    List<AsignaturaViewModel>  result;  
    int total;
    ResultHorario(); 
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> json) {  
       var data=json['result'] as List<dynamic>;  
       total=json['total'] as int;
       result = new List<AsignaturaViewModel>.from(data.map((x) => AsignaturaViewModel().fromJsonMap(x)));  
    }
    @override
    fromJsonList<J,K>(List<dynamic> json) {  
       total=json.length;  
       print(json);
       result = new List<AsignaturaViewModel>.from(json.map((x)=>AsignaturaViewModel().fromJsonMap(x) ));  
     //  print(result[0].asignatura);
    }
    Map<String, dynamic> toJson()=>{};
  
}