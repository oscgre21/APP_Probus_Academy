import 'package:flutter/material.dart';
import 'package:probusaca/src/model/Session.dart';
import 'package:probusaca/src/providers/PushNotificationProvider.dart';
import 'package:probusaca/src/providers/ServicesLoginProvider.dart';

final String domainUrl = "https://probusuniversity.probussystems.com/";
final String endPointSignUp = "api/Login";
final String endPointGestPersonalInfo =
    "api/academicos/estudiantes/estudiante/";
final String endPointGestSession = "api/horarios/estudiantes/matricula/";
final String endPointHistorialNota = "api/academicos/record-nota/matricula/";
final String endPointDocumentacion =
    "api/reportes/academicos/estudiantesdocumentospendiente/matricula/";

/* PROFESOR ENDPOINT */
final String endPointProfSessiones =
    "api/academicos/estudiante-asistencia/secciones-profesor";
final String endPointProfDatosPersonales =
    "api/academicos/profesores/profesores-movil/";
final String endPointProfDisponibilidad =
    "api/academicos/profesores/Disponibilidad/Asignaturas/Profesores-movil/";

final String endPointEstudianteBalance =
    "api/financieros/cobros-servicios/balance-estudiante-app/";

final String endPointProfHorario =
    "api/academicos/profesores/Disponibilidad/Horarios/Profesores-movil/";

final String navDetalleSessionPage = "detalleSessiones";

final String endPointProfAsistenciaList =
    "api/academicos/estudiante-asistencia/estudiantesasistencia/";

final String endPointProfAsistenciaPostOrPut =
    "api/academicos/estudiante-asistencia";

Session session = new Session();

PushNotificationProvider pushProvider = new PushNotificationProvider();

ServicesLoginProvider loginProvider =
    new ServicesLoginProvider(session, pushProvider);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF035AA6);
const kSecondaryColor = Color(0xFFFFA41B);
const kTextColor = Color(0xFF000839);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF40BAD5);

const kDefaultPadding = 20.0;

// our default Shadow
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);
