import 'package:flutter/material.dart';
import 'package:probusaca/src/model/ResultObject.dart';
import 'package:probusaca/src/model/StreamResultObject.dart';
import 'package:probusaca/src/model/result/ResultAsistenciaSessionProf.dart'; 
import 'package:probusaca/src/plugins/cDatatableSessiones.dart'; 
import 'package:probusaca/src/providers/ProfSessionProvider.dart';
import 'package:probusaca/src/utilities/constants.dart';
import 'package:probusaca/src/viewModels/AsignaturaListViewModel.dart';
import 'package:probusaca/src/viewModels/ProfSessionesViewModel.dart';
import 'package:intl/intl.dart';


class DetalleSessionesPageView extends StatefulWidget
 {
  
  DetalleSessionesPageView({Key key}) : super(key: key);

  @override
  _DetalleSessionesPageViewState createState() => _DetalleSessionesPageViewState();
}

class _DetalleSessionesPageViewState extends State<DetalleSessionesPageView> {
 
  var main_menu=new ProfSessionProvider();

  var periodoVm= PutPeriodoViewModel();


  String horarioCompeto="";


  ResultAsistenciaSessionProf asistencia;
  

  @override
  Widget build(BuildContext context) {
    final ProfSessionesViewModel course =  ModalRoute.of(context).settings.arguments;
    
    main_menu.requestNewData(endPointProfAsistenciaList+requestPeriod(course), session.token);
    return Scaffold(
          body: CustomScrollView(
                  slivers: <Widget>[
                          _createAppBar(course),
                          SliverList(
                              delegate: SliverChildListDelegate( 
                                [
                                    _HeaderContainer(course), 
                                //    _videoBaseTitle(course), 
                                    _getDataTable(),
                                ] 
                              ),
                          ),
                           
                      ],
                ),
        bottomNavigationBar: Container(
          height: 50,
          child: InkWell(
                      onTap: (){
                        if (asistencia!=null){
                          
                          var asis= asistencia.result.where((e) => e.asistencia==false).toList(); //asistencia.result.map((e) => e.asistencia==false);
                          periodoVm.asistencias=asis;
                          periodoVm.seccionAsignaturaId=course.seccionAsignaturaId;
                          periodoVm.periodoAcademicoId=course.periodoId;
                         
                          var url=endPointProfAsistenciaPostOrPut;
                          if (asistencia.periodoAcademicoId>0){
                              url=endPointProfAsistenciaPostOrPut+"/${asistencia.periodoAcademicoId}";
                              periodoVm.estudianteAsistenciaId=asistencia.periodoAcademicoId;
                          }
                          main_menu.putAsistencia(url, session.token,periodoVm);
                        }
                      //  course.
                        //print("${model.asigCodigo} ${model.timeSelected}"); 
                       // Navigator.pop(context); 
                        //Navigator.pushNamed(context,navDetalleSessionPage, arguments: model); 
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.blue, 
                          boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 6.0,
                                        ),
                                      ]
                        ),
                        child: Text(
                          "Asignar asistencia",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
        )
    );
  }

  String requestPeriod(ProfSessionesViewModel course){
 
   //  var formatter = new DateFormat('yyyy-MM-dd');
     var year  =DateFormat('yyyy').format(course.timeSelected).toString();
     var month =DateFormat('MM').format(course.timeSelected).toString();
     var day   =DateFormat('dd').format(course.timeSelected).toString();
     var hour  =DateFormat('h').format(course.timeSelected).toString();
     var pmam  =DateFormat('a').format(course.timeSelected).toString();
     var minute=DateFormat('m').format(course.timeSelected).toString();
    // print("${course.periodoId}/${course.seccionAsignaturaId}/${year}/${month}/${day}/${hour}/${minute}/${pmam}");

    horarioCompeto = "${year}/${month}/${day}  -  ${hour}:${minute} ${pmam}";
    periodoVm.ano=int.parse(year);
    periodoVm.mes=int.parse(month);
    periodoVm.dia=int.parse(day);
    periodoVm.hora=int.parse(hour);
    periodoVm.min=int.parse(minute);
    periodoVm.tipoHora=pmam;
     
    return "${course.periodoId}/${course.seccionAsignaturaId}/${year}/${month}/${day}/${hour}/${minute}/${pmam}";
  }

//overflow: TextOverflow.ellipsis,
  Widget _createAppBar(ProfSessionesViewModel course){
      return SliverAppBar(
          elevation: 2.0,
          backgroundColor: Colors.blue[800],
         // expandedHeight: 50,
          floating: true,
          pinned: false,
      );
  }
  //
  Widget _HeaderContainer(ProfSessionesViewModel course){
     return Container(
       // color: Colors.white, 
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Text("${course.asigDescripcion}", style: TextStyle(color: Colors.black87, fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 10.0,),
              Container(
                  child: Row(
                  children: <Widget>[
                    Text("${course.tiSeDescripcion}", style: TextStyle(color: Colors.black87),),
                    SizedBox(width: 20.0,),  
                    Text("${course.asigCodigo}", style: TextStyle(color: Colors.black87),),
                    SizedBox(width: 20.0,),  
                    Text("${course.periodoNombre}", style: TextStyle(color: Colors.black87),),
                    SizedBox(width: 20.0,),  
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Text("${horarioCompeto}", style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 10.0,),
          ],
        ),
     );
  }
 

  Widget _videoBaseTitle(ProfSessionesViewModel course){
      return  Container( 
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container( 
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20), 
                      child: Row( 
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Icon(Icons.play_circle_outline,color: Colors.blue[400],size: 50.0,)
                                ),
                             Container(
                                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15 ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("${course.asigDescripcion}",style: TextStyle(color:Colors.blue[800],fontSize: 25.0)),
                                      SizedBox(height: 5,),
                                      Text("${course.asigCodigo}",style: TextStyle(color:Colors.black,fontSize: 14.0))
                                    ],
                                  )
                              )
                        ],
                      ),
                    )
                  ],
                )
            ); 
  }
  
  Widget _getDataTable(){
    return Container(
            color: Colors.white, 
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: StreamBuilder(
                      initialData:StreamResultObject<IResultObject>() ,
                      stream: main_menu.getStream(),
                      builder: (BuildContext context, AsyncSnapshot datax){  
                          var object = datax.data as  StreamResultObject<IResultObject>;
                
                          if (object.data==null){
                            return Center( child: CircularProgressIndicator());
                          }
                          if (object.valid==Status.LOADING){
                            return Center( child: CircularProgressIndicator());
                          }    
                          if (object.data ==null){
                              return Center( child: CircularProgressIndicator());
                          }  
                            print(object.data.runtimeType); 
                          var asistenciaSession=(object.data as ResultAsistenciaSessionProf);
                          List<AsignaturaListViewModel>  result = asistenciaSession.result; 

                          asistencia=asistenciaSession;

                          return cDatatableSessiones(  
                                      estudiante:result, 
                                      asistencia:asistenciaSession,
                                      action: (info,asis){
                                        
                                        //var select= info as AsignaturaListViewModel;
                                        //var asistencia= asis as ResultAsistenciaSessionProf;
                                       // print("Llegando ${select.asistencia}  ${asistencia.periodoAcademicoId}");

                                      },
                                  );  
                          
                      }),
      );
  }
 

}