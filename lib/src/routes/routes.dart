import 'package:flutter/material.dart';
import 'package:probusaca/src/page/DetalleSessionesPageView.dart';
import 'package:probusaca/src/page/EstudiantePageView.dart';
import 'package:probusaca/src/page/ProfesorPageView.dart';
import 'package:probusaca/src/page/card_page.dart'; 
import 'package:probusaca/src/page/nlogin_page.dart';

 

Map<String, WidgetBuilder> getApplicationRoutes(){ 
  return <String, WidgetBuilder>{
   //   '/' : (BuildContext context)=> HomePageList(),
      'login' : (BuildContext context)=> NLoginPage(),
      'detalleSessiones' : (BuildContext context)=> SafeArea(child: DetalleSessionesPageView(),),
      'Profesor' : (BuildContext context)=> SafeArea(child: ProfesorPageView()),
      'Estudiante' : (BuildContext context)=> SafeArea(child: EstudiantePageView())
  };
}
 