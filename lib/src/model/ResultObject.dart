import 'package:probusaca/src/helpers/ijsontobject.dart';
 

abstract class IResultObject  implements IJsonToObject  {
    @override
    fromJsonMap<J,K>(Map<J,dynamic> data);
    Map<String, dynamic> toJson(); 
    fromJsonList<J,K>(List<dynamic> data);
}