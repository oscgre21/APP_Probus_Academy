import 'package:probusaca/src/model/ResultObject.dart'; 
import 'package:probusaca/src/model/Session.dart';
import 'package:probusaca/src/model/StreamResultObject.dart'; 
import 'package:probusaca/src/model/result/ResultGeneric.dart';  
import 'package:probusaca/src/providers/GenericStreamProvider.dart'; 
import 'package:probusaca/src/utilities/constants.dart';
import 'package:probusaca/src/viewModels/DocumentacionViewModel.dart'; 
 

class DocumentacionProvider extends GenericStreamProvider<StreamResultObject<IResultObject>,ResultGeneric<DocumentacionViewModel>>{ 

    Session session; 
    DocumentacionProvider({this.session});
    @override
    void requestData(){  
      this.postWithdowData(endPointDocumentacion+session.matricula,session.token,this);
    }
  
}
