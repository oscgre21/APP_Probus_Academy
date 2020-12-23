import 'package:probusaca/src/model/ResultObject.dart';
import 'package:probusaca/src/model/ResultObjectDataPerson.dart';
import 'package:probusaca/src/model/Session.dart';
import 'package:probusaca/src/model/StreamResultObject.dart';
import 'package:probusaca/src/providers/GenericStreamProvider.dart';
import 'package:probusaca/src/providers/PushNotificationProvider.dart';
import 'package:probusaca/src/utilities/constants.dart';
import 'package:probusaca/src/viewModels/user_login_view_model.dart';
 

class ServicesLoginProvider extends GenericStreamProvider<StreamResultObject<IResultObject>,ResultObjectDataPerson>{ 
    Session _session;
    PushNotificationProvider _pushProvider;
    ServicesLoginProvider(Session session,PushNotificationProvider pushProvider ){
        _session=session;
        _pushProvider=pushProvider;
    }
    void doLogin({userLogin:UserLoginViewModel}){ 
      userLogin.uPushId=_pushProvider.pushID; 
     // print(userLogin.uPushId);
      this.postLogin<UserLoginViewModel>(endPointSignUp, userLogin,this).then((data) { 
           _session.token=(data.resultObject as ResultObjectDataPerson).token;  
         // print(_session.token);
          _session.matricula=userLogin.user; 
      });
    } 
  
}
