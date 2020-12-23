import 'package:probusaca/src/model/ResultObject.dart'; 
import 'package:probusaca/src/model/Session.dart';
import 'package:probusaca/src/model/StreamResultObject.dart';
import 'package:probusaca/src/model/result/ResultGeneric.dart';  
import 'package:probusaca/src/providers/GenericStreamProvider.dart'; 
import 'package:probusaca/src/utilities/constants.dart';
import 'package:probusaca/src/viewModels/HistoricoNotasViewModel.dart'; 
 

class HistorialNotasProvider extends GenericStreamProvider<StreamResultObject<IResultObject>,ResultGeneric<HistoricoNotasViewModel>>{ 

    Session session;
    
    HistorialNotasProvider({this.session});
    @override
    void requestData(){  
      this.postWithdowData(endPointHistorialNota+session.matricula,session.token,this);
    }
  
}
