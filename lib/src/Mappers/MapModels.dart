import 'package:probusaca/src/helpers/ijsontobject.dart';
import 'package:probusaca/src/viewModels/AsignaturaListViewModel.dart';
import 'package:probusaca/src/viewModels/AsignaturaViewModel.dart';
import 'package:probusaca/src/viewModels/BalanceEstudianteViewModel.dart';
import 'package:probusaca/src/viewModels/DisponibilidadViewModel.dart';
import 'package:probusaca/src/viewModels/DocumentacionViewModel.dart';
import 'package:probusaca/src/viewModels/EstudianteViewModel.dart';
import 'package:probusaca/src/viewModels/EstudiantesSeccionViewModel.dart';
import 'package:probusaca/src/viewModels/HistoricoNotasViewModel.dart';
import 'package:probusaca/src/viewModels/HorarioProfesorViewModel.dart';
import 'package:probusaca/src/viewModels/HorarioViewModel.dart';
import 'package:probusaca/src/viewModels/ProfSessionesViewModel.dart';
import 'package:probusaca/src/viewModels/ProfesorViewModel.dart';

class MapModels {
  Map<String, IJsonToObject> _mapList;

  MapModels(Map<String, IJsonToObject> mapperList) {
    _mapList = mapperList;
  }

  addMapper(String clase, IJsonToObject obj) {
    _mapList[clase] = obj;
  }

  IJsonToObject getMapper<T>() {
    Type typeOf<T>() => T;
    Type type = typeOf<T>();
    MapModels.initMapper();
    var indice = type.toString();
    var map = {
      "AsignaturaViewModel": new AsignaturaViewModel(),
      "DocumentacionViewModel": new DocumentacionViewModel(),
      "EstudianteViewModel": new EstudianteViewModel(),
      "HistoricoNotasViewModel": new HistoricoNotasViewModel(),
      "HorarioViewModel": new HorarioViewModel(),
      "ProfSessionesViewModel": new ProfSessionesViewModel(),
      "ProfesorViewModel": new ProfesorViewModel(),
      "DisponibilidadViewModel": new DisponibilidadViewModel(),
      "EstudiantesSeccionViewModel": new EstudiantesSeccionViewModel(),
      "HorarioProfesorViewModel": HorarioProfesorViewModel(),
      "AsignaturaListViewModel": AsignaturaListViewModel(),
      "BalanceEstudianteViewModel": BalanceEstudianteViewModel()
    };
    var data = map[indice];
    map = {};
    return data;
  }

  MapModels.initMapper() {}
}
