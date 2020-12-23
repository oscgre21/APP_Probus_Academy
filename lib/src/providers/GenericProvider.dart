import 'package:probusaca/src/helpers/ijsontobject.dart'; 
import 'package:probusaca/src/model/ResultObject.dart'; 
import 'package:probusaca/src/model/Session.dart';
import 'package:probusaca/src/model/StreamResultObject.dart'; 
import 'package:probusaca/src/model/result/ResultGeneric.dart';
import 'package:probusaca/src/providers/GenericStreamProvider.dart';  
 

class GenericProvider<T extends IJsonToObject> extends GenericStreamProvider<StreamResultObject<IResultObject>,ResultGeneric<T>>{ 

    Session session;
    String endPoint;
    GenericProvider({this.session,this.endPoint});
    @override
    void requestData(){  
      this.postWithdowData(endPoint,session.token,this);
    }
  
}
