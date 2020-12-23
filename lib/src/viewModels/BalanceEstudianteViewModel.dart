import 'package:probusaca/src/helpers/ijsontobject.dart';

class BalanceEstudianteViewModel extends IJsonToObject {
  String matricula;
  String nombre;
  String apellido;
  String nombreCompleto;
  String balance;
  String monedaEstudiante;

  // List<EstudiantesSeccionViewModel> listadoEstudiantesSession;

  BalanceEstudianteViewModel();

  @override
  fromJsonMap<J, K>(Map<dynamic, dynamic> data) {
    matricula = data['matricula'] as String;
    nombre = data['nombre'] as String;
    apellido = data['apellido'] as String;
    nombreCompleto = data['nombreCompleto'] as String;
    balance = data['balance'].toString();
    monedaEstudiante = data['monedaEstudiante'] as String;
    return this;
  }

  Map<String, dynamic> toJson() => {};
  fromJsonList<J, K>(List<dynamic> data) {}
}
