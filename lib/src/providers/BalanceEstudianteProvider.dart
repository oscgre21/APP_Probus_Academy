import 'package:probusaca/src/model/ResultObject.dart';
import 'package:probusaca/src/model/Session.dart';
import 'package:probusaca/src/model/StreamResultObject.dart';
import 'package:probusaca/src/model/result/ResultBalanceEstudiante.dart';
import 'package:probusaca/src/providers/GenericStreamProvider.dart';
import 'package:probusaca/src/utilities/constants.dart';

class BalanceEstudianteProvider extends GenericStreamProvider<
    StreamResultObject<IResultObject>, ResultBalanceEstudiante> {
  Session session;

  BalanceEstudianteProvider({this.session});
  @override
  void requestData() {
    this.postWithdowDataMap(
        endPointEstudianteBalance + session.matricula, session.token, this);
  }
}
