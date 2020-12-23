import 'package:probusaca/src/helpers/ijsontobject.dart';

class UserLoginViewModel implements IJsonToObject {

  String user="";
  String passw=""; 
  bool recordarPassword=false;
  String uPushId="";

  UserLoginViewModel(); 

  @override
  fromJsonMap<J,K>(Map<J,dynamic> json) {
      //json['']; 
  }
  Map<String, dynamic> toJson()=>{
      "userName":user,
      "Clave": passw,
      "sedId": "1",
      "DeviceId":uPushId
  };
  fromJsonList<J,K>(List<dynamic> data) {  }
}