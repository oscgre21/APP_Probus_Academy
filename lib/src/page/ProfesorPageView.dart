import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:probusaca/src/model/ResultObject.dart';
import 'package:probusaca/src/model/StreamResultObject.dart';
import 'package:probusaca/src/model/result/ResultGeneric.dart';
import 'package:probusaca/src/page/components/FABBottomAppBar.dart';
import 'package:probusaca/src/page/components/ListViewProfSessiones.dart';
import 'package:probusaca/src/plugins/cDataTableDisponibilidad.dart';
import 'package:probusaca/src/plugins/cDataTableHorarioProf.dart';
import 'package:probusaca/src/providers/GenericProvider.dart';
import 'package:probusaca/src/providers/GenericStreamProvider.dart';
import 'package:probusaca/src/utilities/constants.dart';
import 'package:probusaca/src/viewModels/DisponibilidadViewModel.dart';
import 'package:probusaca/src/viewModels/HorarioProfesorViewModel.dart';
import 'package:probusaca/src/viewModels/ProfSessionesViewModel.dart';
import 'package:probusaca/src/viewModels/ProfesorViewModel.dart';

import 'components/DatosPersonalesProfCard.dart';

class ProfesorPageView extends StatefulWidget {
  @override
  _ProfesorPageView createState() => _ProfesorPageView();
}

class _ProfesorPageView extends State<ProfesorPageView> {
  List<GenericStreamProvider> main_menu = [
    new GenericProvider<ProfesorViewModel>(
        session: session,
        endPoint: endPointProfDatosPersonales + session.matricula),
    new GenericProvider<HorarioProfesorViewModel>(
        session: session, endPoint: endPointProfHorario + session.matricula),
    new GenericProvider<DisponibilidadViewModel>(
        session: session,
        endPoint: endPointProfDisponibilidad + session.matricula),
    new GenericProvider<ProfSessionesViewModel>(
        session: session, endPoint: endPointProfSessiones),
  ];

  int index_menu = 0;

  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      index_menu = index;
      main_menu[index_menu].requestData();
      print('TAB: $index');
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
    return FloatingActionButton(
      onPressed: () {
        main_menu[index_menu].requestData();
        /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondScreen()),
          );*/
      },
      tooltip: 'Probus Acadamy',
      backgroundColor: Colors.white,
      child: Image.asset(
        'assets/probus_logo_vert.png',
        width: 45.0,
        height: 45.0,
      ),
      elevation: 2.0,
    );
  }

  @override
  void initState() {
    super.initState();
    main_menu[index_menu].requestData();
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              kPrimaryColor,
              kPrimaryColor,
            ])),
        height: double.infinity,
        child: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            margin: EdgeInsets.only(top: 80),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),
          Container(
            child: StreamBuilder(
                initialData: StreamResultObject<IResultObject>(),
                stream: main_menu[index_menu].getStream(),
                builder: (BuildContext context, AsyncSnapshot datax) {
                  var object = datax.data as StreamResultObject<IResultObject>;

                  if (object.data == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (object.valid == Status.LOADING) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (object.data == null) {
                    return Center(child: CircularProgressIndicator());
                  }

                  print(index_menu);
                  print(object.data.runtimeType);
                  var runtimeType = object.data.runtimeType.toString();

                  //ResultGeneric<AsignaturaViewModel>

                  if (runtimeType != "ResultGeneric<ProfSessionesViewModel>" &&
                      index_menu == 3) {
                    return Center(child: CircularProgressIndicator());
                  } else if (runtimeType !=
                          "ResultGeneric<ProfesorViewModel>" &&
                      index_menu == 0) {
                    return Center(child: CircularProgressIndicator());
                  } else if (runtimeType !=
                          "ResultGeneric<DisponibilidadViewModel>" &&
                      index_menu == 2) {
                    return Center(child: CircularProgressIndicator());
                  } else if (runtimeType !=
                          "ResultGeneric<HorarioProfesorViewModel>" &&
                      index_menu == 1) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (runtimeType == "ResultGeneric<ProfSessionesViewModel>" &&
                      index_menu == 3) {
                    List<ProfSessionesViewModel> result =
                        (object.data as ResultGeneric<dynamic>).result;
                    return ListViewProfSessiones(
                      result: result,
                      press: (model) {
                        var data = model as ProfSessionesViewModel;
                        //print(data.periodoNombre);
                        _createDialog(context, data);
                      },
                    );
                  } else if (runtimeType ==
                          "ResultGeneric<ProfesorViewModel>" &&
                      index_menu == 0) {
                    List<ProfesorViewModel> result =
                        (object.data as ResultGeneric<dynamic>).result;
                    return DatosPersonalesProfCard(
                      data: result[0],
                    );
                  } else if (runtimeType ==
                          "ResultGeneric<DisponibilidadViewModel>" &&
                      index_menu == 2) {
                    List<DisponibilidadViewModel> result =
                        (object.data as ResultGeneric<dynamic>).result;
                    return cDataTableDisponibilidad(
                      data: result,
                    );
                  } else if (runtimeType ==
                          "ResultGeneric<HorarioProfesorViewModel>" &&
                      index_menu == 1) {
                    List<HorarioProfesorViewModel> result =
                        (object.data as ResultGeneric<dynamic>).result;
                    return cDataTableHorarioProf(
                      data: result,
                    );
                  }
                }),
          )
        ]),
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Inicio',
        color: Colors.grey,
        selectedColor: Color(0xFF035AA6),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.account_circle, text: 'Perfil'),
          FABBottomAppBarItem(iconData: Icons.timer, text: 'Horarios'),
          FABBottomAppBarItem(
            iconData: Icons.timelapse,
            text: 'Disponibilidad',
          ),
          FABBottomAppBarItem(iconData: Icons.apps, text: 'Sessiones'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context),
    );
  }

  _createDialog(BuildContext context, ProfSessionesViewModel model) {
    return showDialog(
        context: context,
        builder: (context) {
          model.timeSelected = DateTime.now();
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Seleccione periodo de asistencia",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  SizedBox(
                      height: 200,
                      child: CupertinoTheme(
                        data: CupertinoThemeData(
                          textTheme: CupertinoTextThemeData(
                            dateTimePickerTextStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        child: CupertinoDatePicker(
                          initialDateTime: DateTime.now(),
                          maximumDate: DateTime.now(),
                          onDateTimeChanged: (datetime) {
                            model.timeSelected = datetime;
                            print(datetime);
                          },
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      print("${model.asigCodigo} ${model.timeSelected}");
                      Navigator.pop(context);
                      Navigator.pushNamed(context, navDetalleSessionPage,
                          arguments: model);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        "Asignar asistencia",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
