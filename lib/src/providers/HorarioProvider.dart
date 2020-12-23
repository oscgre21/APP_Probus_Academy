import 'package:probusaca/src/model/ResultObject.dart'; 
import 'package:probusaca/src/model/Session.dart';
import 'package:probusaca/src/model/StreamResultObject.dart';
import 'package:probusaca/src/model/result/ResultGeneric.dart';  
import 'package:probusaca/src/providers/GenericStreamProvider.dart'; 
import 'package:probusaca/src/utilities/constants.dart';
import 'package:probusaca/src/viewModels/AsignaturaViewModel.dart'; 
 

class HorarioProvider extends GenericStreamProvider<StreamResultObject<IResultObject>,ResultGeneric<AsignaturaViewModel>>{ 

    Session session;
    
    HorarioProvider({this.session});
    @override
    void requestData(){  
      this.postWithdowData(endPointGestSession+session.matricula,session.token,this);
    }
  
}
