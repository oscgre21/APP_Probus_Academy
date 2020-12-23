import 'package:probusaca/src/model/ResultObject.dart';
import 'package:probusaca/src/viewModels/BalanceEstudianteViewModel.dart';

class ResultBalanceEstudiante implements IResultObject {
  BalanceEstudianteViewModel balance;

  ResultBalanceEstudiante();

  @override
  fromJsonMap<J, K>(Map<J, dynamic> data) {
    balance = new BalanceEstudianteViewModel().fromJsonMap(data);

    return this;
  }

  Map<String, dynamic> toJson() => {};
  fromJsonList<J, K>(List<dynamic> data) {}
}
