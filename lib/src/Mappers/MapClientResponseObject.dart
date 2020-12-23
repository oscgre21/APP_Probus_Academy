import 'package:probusaca/src/model/ResultObject.dart';
import 'package:probusaca/src/model/ResultObjectDataPerson.dart';
import 'package:probusaca/src/model/result/ResultAsistenciaSessionProf.dart';
import 'package:probusaca/src/model/result/ResultBalanceEstudiante.dart';
import 'package:probusaca/src/model/result/ResultGeneric.dart';
import 'package:probusaca/src/model/result/ResultHistorialNotas.dart';
import 'package:probusaca/src/model/result/ResultHorario.dart';
import 'package:probusaca/src/viewModels/AsignaturaViewModel.dart';
import 'package:probusaca/src/viewModels/BalanceEstudianteViewModel.dart';
import 'package:probusaca/src/viewModels/DisponibilidadViewModel.dart';
import 'package:probusaca/src/viewModels/DocumentacionViewModel.dart';
import 'package:probusaca/src/viewModels/EstudianteViewModel.dart';
import 'package:probusaca/src/viewModels/HistoricoNotasViewModel.dart';
import 'package:probusaca/src/viewModels/HorarioProfesorViewModel.dart';
import 'package:probusaca/src/viewModels/ProfSessionesViewModel.dart';
import 'package:probusaca/src/viewModels/ProfesorViewModel.dart';

class MapClientResponseObject {
  Map<String, IResultObject> _mapList;

  MapClientResponseObject(Map<String, IResultObject> mapperList) {
    _mapList = mapperList;
  }

  addMapper(String clase, IResultObject obj) {
    _mapList[clase] = obj;
  }

  IResultObject getMapper<T>() {
    Type typeOf<T>() => T;
    Type type = typeOf<T>();
    MapClientResponseObject.initMapper();
    var data = _mapList[type.toString()];
    return data;
  }

  MapClientResponseObject.initMapper() {
    _mapList = {
      "ResultHorario": new ResultHorario(),
      "ResultHistorialNotas": new ResultHistorialNotas(),
      "ResultObjectDataPerson": new ResultObjectDataPerson(),
      "ResultGeneric<AsignaturaViewModel>":
          ResultGeneric<AsignaturaViewModel>(),
      "ResultGeneric<EstudianteViewModel>":
          ResultGeneric<EstudianteViewModel>(),
      "ResultGeneric<DocumentacionViewModel>":
          ResultGeneric<DocumentacionViewModel>(),
      "ResultGeneric<HistoricoNotasViewModel>":
          ResultGeneric<HistoricoNotasViewModel>(),
      "ResultGeneric<ProfSessionesViewModel>":
          ResultGeneric<ProfSessionesViewModel>(),
      "ResultGeneric<ProfesorViewModel>": ResultGeneric<ProfesorViewModel>(),
      "ResultGeneric<DisponibilidadViewModel>":
          ResultGeneric<DisponibilidadViewModel>(),
      "ResultGeneric<HorarioProfesorViewModel>":
          ResultGeneric<HorarioProfesorViewModel>(),
      "ResultAsistenciaSessionProf": ResultAsistenciaSessionProf(),
      "ResultBalanceEstudiante": ResultBalanceEstudiante()
    };
  }
}
