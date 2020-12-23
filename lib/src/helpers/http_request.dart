import 'dart:convert'; 
import 'package:http/http.dart' as http;
import 'package:probusaca/src/helpers/IStreamProvider.dart';
import 'package:probusaca/src/helpers/JwtDecode.dart';
import 'package:probusaca/src/helpers/ijsontobject.dart';
import 'package:probusaca/src/model/ResultObject.dart';
import 'package:probusaca/src/model/ResultObjectDataPerson.dart';
import 'package:probusaca/src/model/StreamResultObject.dart';
import 'package:probusaca/src/model/client_response.dart';
import 'package:probusaca/src/providers/ProfSessionProvider.dart'; 
import 'package:probusaca/src/utilities/constants.dart';

class HttpRequest<E extends IResultObject>{

    Map<String,String> _headers = {
        'Content-Type' : 'application/json', 
        'Accept': 'application/json',
      };
    Future<ClientResponse<E>> post<J>(String endPointAction, J data, String auth_token, IStreamProvider provider) async  {
        //assert(auth_token==null,"");
        //final url = Uri.https(domainUrl, endPointAction,{});
         var retorno =new ClientResponse<E>();
         retorno.success=false;
         var envolve= new StreamResultObject<IResultObject>();
         envolve.valid=Status.LOADING;
         provider.addSink(envolve);
         try {
            final _object = (data as IJsonToObject);

            _headers['Authorization']=auth_token;
            //var body = json.decode(data); 
          //  print(_object.toJson());
            final response = await http.post(domainUrl+endPointAction,headers: _headers,body: json.encode(_object.toJson()) );
            final decodedData = json.decode(response.body);
            envolve.valid=Status.SUCCESS;
            retorno.success=true;
            retorno.fromJsonMap(decodedData);  
            envolve.data = retorno.resultObject;
            provider.addSink(envolve);
         } catch(e) {
           retorno.success=false;
           envolve.valid=Status.ERROR;
           provider.addSink(envolve);
           // print(e.toString()); 
         }

        //servicesLoginSink();
        //print(response.body);     
        return retorno;
    }

    Future<ClientResponse<E>> postWithdowData<J>(String endPointAction,String auth_token, IStreamProvider provider) async  {
        //assert(auth_token==null,"");
        //final url = Uri.https(domainUrl, endPointAction,{});
         var retorno =new ClientResponse<E>();
         retorno.success=false;
         var envolve= new StreamResultObject<IResultObject>();
         envolve.valid=Status.LOADING; 
         provider.addSink(envolve);
         try {
            
            _headers['Authorization']=auth_token;
          //  print(_headers['Authorization']);
            final response = await http.get(domainUrl+endPointAction,headers: _headers);
           // print(auth_token);
          //  print(response.body);

            if (response.statusCode==200){ 
                final decodedData = json.decode(response.body);
                envolve.valid=Status.SUCCESS;
                retorno.success=true;
                retorno.fromJsonList(decodedData);  
                
                envolve.data = retorno.resultObject;
                provider.addSink(envolve);
            }else{
                retorno.success=false;
                envolve.valid=Status.ERROR;
                provider.addSink(envolve);
            }

         } catch(e) {
           retorno.success=false;
           envolve.valid=Status.ERROR;
           provider.addSink(envolve);
           // print(e.toString()); 
         }

        //servicesLoginSink();
        //print(response.body);     
        return retorno;
    }

    Future<ClientResponse<E>> postAsistencia<J>(String endPointAction,String auth_token, IStreamProvider provider,PutPeriodoViewModel periodo) async  {
        //assert(auth_token==null,"");
        //final url = Uri.https(domainUrl, endPointAction,{});
         var retorno =new ClientResponse<E>();
         retorno.success=false;
         var envolve= new StreamResultObject<IResultObject>();
         envolve.valid=Status.LOADING; 
         provider.addSink(envolve);
         try {
            
            _headers['Authorization']=auth_token;
          //  print(_headers['Authorization']);
            print(json.encode(periodo.toJson()));
            final response = periodo.estudianteAsistenciaId>0? 
                              await http.put(domainUrl+endPointAction,headers: _headers, body: json.encode(periodo.toJson())): 
                              await http.post(domainUrl+endPointAction,headers: _headers, body: json.encode(periodo.toJson()));
            
           // print(auth_token);
            //print(response.body);
            if (response.statusCode==200){ 
                //final decodedData = json.decode(response.body);
              /*  envolve.valid=Status.SUCCESS;
                retorno.success=true;
                retorno.fromJsonMap(decodedData);  
                
                envolve.data = retorno.resultObject;
                provider.addSink(envolve);*/
            }else{
                retorno.success=false;
               // envolve.valid=Status.ERROR;
               // provider.addSink(envolve);
            }

         } catch(e) {
           retorno.success=false;
         //  envolve.valid=Status.ERROR;
         //  provider.addSink(envolve);
           // print(e.toString()); 
         }

        //servicesLoginSink();
        //print(response.body);     
        return retorno;
    }

    Future<ClientResponse<E>> postWithdowDataMap<J>(String endPointAction,String auth_token, IStreamProvider provider) async  {
        //assert(auth_token==null,"");
        //final url = Uri.https(domainUrl, endPointAction,{});
         var retorno =new ClientResponse<E>();
         retorno.success=false;
         var envolve= new StreamResultObject<IResultObject>();
         envolve.valid=Status.LOADING; 
         provider.addSink(envolve);
         try {
            
            _headers['Authorization']=auth_token;
          //  print(_headers['Authorization']);
            final response = await http.get(domainUrl+endPointAction,headers: _headers);
           // print(auth_token);
          //  print(response.body);

            if (response.statusCode==200){ 
                final decodedData = json.decode(response.body);
                envolve.valid=Status.SUCCESS;
                retorno.success=true;
                retorno.fromJsonMap(decodedData);  
                
                envolve.data = retorno.resultObject;
                provider.addSink(envolve);
            }else{
                retorno.success=false;
                envolve.valid=Status.ERROR;
                provider.addSink(envolve);
            }

         } catch(e) {
           retorno.success=false;
           envolve.valid=Status.ERROR;
           provider.addSink(envolve);
           // print(e.toString()); 
         }

        //servicesLoginSink();
        //print(response.body);     
        return retorno;
    }
    Future<ClientResponse<E>> postLogin<J>(String endPointAction, J data,IStreamProvider provider) async  {
        //assert(auth_token==null,"");
        //final url = Uri.https(domainUrl, endPointAction,{});
         var retorno =new ClientResponse<E>();
         retorno.success=false;
         var envolve= new StreamResultObject<IResultObject>();
         envolve.valid=Status.LOADING;
         provider.addSink(envolve);
         try {
            //_headers['token']=auth_token;
            final _object = (data as IJsonToObject); 
            final response = await http.post(domainUrl+endPointAction,headers: _headers,body: json.encode(_object.toJson()) );
           // print(domainUrl+endPointAction); 
           // print(json.encode(_object.toJson()));
                 
            if (response.statusCode==200){ 
              final token = response.body;
              envolve.valid=Status.SUCCESS;
              retorno.success=true;
              //var pdata=new ResultObjectDataPerson(); 
              var jwdecode =parseJwt(token.replaceAll('"', '')); 
              //retorno.resultObject = pdata;
              retorno.fromJsonMap(jwdecode);  
              (retorno.resultObject as ResultObjectDataPerson).token="Bearer "+token.replaceAll('"', '');

              envolve.data = retorno.resultObject;
              provider.addSink(envolve);
            }else{
              retorno.success=false;
              envolve.valid=Status.ERROR;
              provider.addSink(envolve);
            }
         } catch(e) {
           retorno.success=false;
           envolve.valid=Status.ERROR;
           provider.addSink(envolve);
           // print(e.toString()); 
         }

        //servicesLoginSink();
        //print(response.body);     
        return retorno;
    }

}