


 abstract class IJsonToObject{ 
    fromJsonMap<J,K>(Map<J,dynamic> json);
    Map<String, dynamic> toJson();
    fromJsonList<J,K>(List<dynamic> data); 
}