import 'package:flutter/material.dart';
import 'package:probusaca/src/model/ResultObject.dart';
import 'package:probusaca/src/model/StreamResultObject.dart';
import 'package:probusaca/src/model/result/ResultBalanceEstudiante.dart';
import 'package:probusaca/src/model/result/ResultGeneric.dart';
import 'package:probusaca/src/page/components/BalanceEstudianteCard.dart';
import 'package:probusaca/src/page/components/FABBottomAppBar.dart';
import 'package:probusaca/src/page/components/ListViewAsignatura.dart';
import 'package:probusaca/src/page/components/ListViewDocumentacion.dart';
import 'package:probusaca/src/page/components/ListViewGeneralInformation.dart';
import 'package:probusaca/src/page/components/ListViewHistorialNotas.dart';
import 'package:probusaca/src/providers/BalanceEstudianteProvider.dart';
import 'package:probusaca/src/providers/DocumentacionProvider.dart';
import 'package:probusaca/src/providers/GeneralInformationProvider.dart';
import 'package:probusaca/src/providers/GenericProvider.dart';
import 'package:probusaca/src/providers/GenericStreamProvider.dart';
import 'package:probusaca/src/providers/HistorialNotasProvider.dart';
import 'package:probusaca/src/providers/HorarioProvider.dart';
import 'package:probusaca/src/utilities/constants.dart';
import 'package:probusaca/src/viewModels/AsignaturaViewModel.dart';
import 'package:probusaca/src/viewModels/BalanceEstudianteViewModel.dart';
import 'package:probusaca/src/viewModels/DocumentacionViewModel.dart';
import 'package:probusaca/src/viewModels/EstudianteViewModel.dart';
import 'package:probusaca/src/viewModels/HistoricoNotasViewModel.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class EstudiantePageView extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<EstudiantePageView>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  final ginformation = new GeneralInformationProvider(session: session);
  int index_menu = 0;

  List<GenericStreamProvider> main_menu = [
    new GeneralInformationProvider(session: session),
    new HorarioProvider(session: session),
    new HistorialNotasProvider(session: session),
    new DocumentacionProvider(session: session),
    new BalanceEstudianteProvider(session: session),
  ];

  @override
  void initState() {
    super.initState();
    main_menu[index_menu].requestData();

    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: backgroundColor,
        //  appBar: buildAppBar(),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5),
              ])),
          child: Stack(
            children: <Widget>[
              // menu(context),
              dashboard(context),
            ],
          ),
        ),
        bottomNavigationBar: FABBottomAppBar(
          centerItemText: 'Balance',
          color: Colors.grey,
          selectedColor: Color(0xFF035AA6),
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _selectedTab,
          items: [
            FABBottomAppBarItem(iconData: Icons.apps, text: 'Perfil'),
            FABBottomAppBarItem(iconData: Icons.timer, text: 'Horarios'),
            FABBottomAppBarItem(
              iconData: Icons.timelapse,
              text: 'Notas',
            ),
            FABBottomAppBarItem(
                iconData: Icons.account_circle, text: 'Documentación'),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildFab(context),
      ),
    );
  }

  void _selectedTab(int index) {
    setState(() {
      index_menu = index;
      main_menu[index_menu].requestData();
      print('TAB: $index');
      // _lastSelected = 'TAB: $index';
    });
  }

  Widget _buildFab(BuildContext context) {
    //final icons = [Icons.sms, Icons.mail, Icons.phone];
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          index_menu = 4;
          main_menu[index_menu].requestData();
        });
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

  Widget menu(context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print("GestureDetector");
          if (isCollapsed)
            _controller.forward();
          else
            _controller.reverse();
          isCollapsed = !isCollapsed;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF478DE0),
              kPrimaryColor,
              Color(0xFF478DE0),
            ])),
        child: SlideTransition(
          position: _slideAnimation,
          child: ScaleTransition(
            scale: _menuScaleAnimation,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          print("Dashboard");
                        },
                        child: Text("Mi perfil",
                            style:
                                TextStyle(color: Colors.white, fontSize: 22))),
                    SizedBox(height: 20),
                    Text("Balance",
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                    SizedBox(height: 20),
                    Text("Salir",
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
            animationDuration: duration,
            borderRadius: isCollapsed
                ? BorderRadius.all(Radius.circular(0))
                : BorderRadius.all(Radius.circular(_scaleAnimation.value * 20)),
            elevation: 10,
            child: Container(
              //padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              decoration: BoxDecoration(
                  borderRadius: isCollapsed
                      ? BorderRadius.all(Radius.circular(0))
                      : BorderRadius.all(
                          Radius.circular(_scaleAnimation.value * 20)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        kPrimaryColor,
                        kPrimaryColor,
                      ])),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          /*InkWell(
                            child: Icon(Icons.menu, color: Colors.white),
                            onTap: () {
                              setState(() {
                                if (isCollapsed)
                                  _controller.forward();
                                else
                                  _controller.reverse();

                                isCollapsed = !isCollapsed;
                              });
                            },
                          ),*/
                          Text("Probus Academy",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white)),
                          InkWell(
                            child: SizedBox(
                              height: 10,
                            ), // SvgPicture.asset("assets/icons/notification.svg"),
                            onTap: () {
                              setState(() {
                                //  print("Actualizando");
                                main_menu[index_menu].requestData();
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Stack(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 70),
                          decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                        RefreshIndicator(
                          onRefresh: refresh,
                          child: StreamBuilder(
                              initialData: StreamResultObject<IResultObject>(),
                              stream: main_menu[index_menu].getStream(),
                              builder:
                                  (BuildContext context, AsyncSnapshot datax) {
                                var object = datax.data
                                    as StreamResultObject<IResultObject>;

                                if (object.data == null) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                //datax.connectionState
                                if (object.valid == Status.LOADING) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                if (object.data == null) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                var runtimeTye =
                                    object.data.runtimeType.toString();
                                print(index_menu);
                                print(object.data.runtimeType);
                                if (runtimeTye !=
                                        "ResultGeneric<AsignaturaViewModel>" &&
                                    index_menu == 1) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (runtimeTye !=
                                        "ResultGeneric<EstudianteViewModel>" &&
                                    index_menu == 0) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (runtimeTye !=
                                        "ResultGeneric<HistoricoNotasViewModel>" &&
                                    index_menu == 2) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (runtimeTye !=
                                        "ResultGeneric<DocumentacionViewModel>" &&
                                    index_menu == 3) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (runtimeTye !=
                                        "ResultBalanceEstudiante" &&
                                    index_menu == 4) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }

                                //Histórico de Notas
                                if (runtimeTye ==
                                    "ResultGeneric<EstudianteViewModel>") {
                                  List<EstudianteViewModel> result = (object
                                              .data
                                          as ResultGeneric<EstudianteViewModel>)
                                      .result;
                                  return ListViewGeneralInformation(
                                      result: result);
                                } else if (runtimeTye ==
                                    "ResultGeneric<AsignaturaViewModel>") {
                                  List<AsignaturaViewModel> result = (object
                                              .data
                                          as ResultGeneric<AsignaturaViewModel>)
                                      .result;
                                  return ListViewAsignatura(result: result);
                                } else if (runtimeTye ==
                                    "ResultGeneric<HistoricoNotasViewModel>") {
                                  List<HistoricoNotasViewModel> result =
                                      (object.data as ResultGeneric<
                                              HistoricoNotasViewModel>)
                                          .result;
                                  return ListViewHistorialNotas(result: result);
                                } else if (runtimeTye ==
                                    "ResultGeneric<DocumentacionViewModel>") {
                                  List<DocumentacionViewModel> result =
                                      (object.data as ResultGeneric<
                                              DocumentacionViewModel>)
                                          .result;

                                  return ListViewDocumentacion(result: result);
                                } else if (runtimeTye ==
                                    "ResultBalanceEstudiante") {
                                  BalanceEstudianteViewModel result =
                                      (object.data as ResultBalanceEstudiante)
                                          .balance;

                                  return BalanceEstudianteCard(data: result);
                                }
                              }),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Future<void> refresh() {
    // dummy code
    main_menu[index_menu].requestData();
    return Future.value();
  }
}
