import 'package:probusaca/src/model/ResultObject.dart'; 
import 'package:probusaca/src/model/Session.dart';
import 'package:probusaca/src/model/StreamResultObject.dart'; 
import 'package:probusaca/src/model/result/ResultGeneric.dart';
import 'package:probusaca/src/providers/GenericStreamProvider.dart'; 
import 'package:probusaca/src/utilities/constants.dart';
import 'package:probusaca/src/viewModels/EstudianteViewModel.dart'; 
 

class GeneralInformationProvider extends GenericStreamProvider<StreamResultObject<IResultObject>,ResultGeneric<EstudianteViewModel>>{ 

    Session session;
    
    GeneralInformationProvider({this.session});
    @override
    void requestData(){  
      this.postWithdowData(endPointGestPersonalInfo+session.matricula,session.token,this);
    }
  
}
