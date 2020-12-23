import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:probusaca/src/page/EstudiantePageView.dart';  
import 'package:probusaca/src/providers/PushNotificationProvider.dart';
import 'package:probusaca/src/routes/routes.dart'; 

class MyAPP extends StatefulWidget{
  @override
  _MyAPPState createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();
  }

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    
    return MaterialApp( 
        debugShowCheckedModeBanner: false,
        routes: getApplicationRoutes(),
        initialRoute: 'login', 
        onGenerateRoute: (settings){
            return MaterialPageRoute(
                  builder: (context) => EstudiantePageView()
            );
        },
    ) ;
  } 
}