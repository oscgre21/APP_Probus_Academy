import 'package:probusaca/src/Mappers/MapModels.dart';
import 'package:probusaca/src/helpers/ijsontobject.dart';
import 'package:probusaca/src/model/ResultObject.dart';  
  
class ResultGeneric<L extends IJsonToObject> implements IResultObject{ 
    List<L>  result;  
    int total;
    ResultGeneric(); 
    @override
    fromJsonMap<J,K>(Map<dynamic,dynamic> json) {  
       var data=json['result'] as List<dynamic>;   
       total=json['total'] as int;
       final MapModels filter= MapModels.initMapper();
       var resultObject= filter.getMapper<L>();
       result = new List<L>.from(data.map((x) => resultObject.fromJsonMap(x)));  
    }
    @override
    fromJsonList<J,K>(List<dynamic> json) {  
       total=json.length;  
  
       final MapModels filter= MapModels.initMapper();
    //   var resultObject= filter.getMapper<T>();
      // resultObject.fromJsonList(data); 
       result = new List<L>.from(json.map((x)=>filter.getMapper<L>().fromJsonMap(x) ));  
       //result = new List<AsignaturaViewModel>.from(json.map((x)=>AsignaturaViewModel().fromJsonMap(x) ));  
     //  print(result[0].asignatura);
    }
    Map<String, dynamic> toJson()=>{};
  
}