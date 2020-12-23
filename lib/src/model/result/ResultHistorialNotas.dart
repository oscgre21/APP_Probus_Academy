import 'package:probusaca/src/model/ResultObject.dart';
import 'package:probusaca/src/viewModels/HistoricoNotasViewModel.dart';
 

class ResultHistorialNotas implements IResultObject{ 
    List<HistoricoNotasViewModel>  result;  
    int total;
    ResultHistorialNotas(); 
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> json) {  
       var data=json['result'] as List<dynamic>;  
       total=json['total'] as int;
       result = new List<HistoricoNotasViewModel>.from(data.map((x) => HistoricoNotasViewModel().fromJsonMap(x)));  
    }
    @override
    fromJsonList<J,K>(List<dynamic> json) {  
       total=json.length;   
       result = new List<HistoricoNotasViewModel>.from(json.map((x)=>HistoricoNotasViewModel().fromJsonMap(x) ));  
    }
    Map<String, dynamic> toJson()=>{};
  
}