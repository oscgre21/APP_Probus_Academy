import 'package:flutter/material.dart';
import 'package:probusaca/src/model/result/ResultAsistenciaSessionProf.dart';
import 'package:probusaca/src/viewModels/AsignaturaListViewModel.dart'; 
 
class cDatatableSessiones extends StatefulWidget {
  final List<AsignaturaListViewModel> estudiante;
  final ResultAsistenciaSessionProf asistencia;
  final Function action;
  const cDatatableSessiones({ Key key, this.estudiante,this.asistencia, this.action}): super(key: key);
  @override
  cDatatableSessionesState createState() {
    return new cDatatableSessionesState();
  }
}

class cDatatableSessionesState extends State<cDatatableSessiones> {
 
  Widget bodyData() {
  
    return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                onSelectAll: (b) {}, 
                sortAscending: true,
                dataRowHeight: 60,
                columns: <DataColumn>[ 
                  DataColumn(
                    label: Text(
                        "Lista de estudiantes",style: TextStyle(fontSize: 18.0,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    numeric: false, 
                    tooltip: "Lista de estudiantes",
                  ),   
                ],
                rows: widget.estudiante
                    .map(
                      (data) => DataRow(
                            cells: [ 
                              DataCell(
                                Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                          Checkbox(
                                              value: data.asistencia,
                                              onChanged: (bool value) {
                                                  setState(() {
                                                      data.asistencia = value;
                                                      
                                                      if (widget.action!=null){
                                                          widget.action(data,widget.asistencia);
                                                          /*{
                                                                "data":data,
                                                                "asistencia": widget.asistencia
                                                          });*/
                                                      }
                                                      
                                                  });
                                              },
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(vertical: 5),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                  Text("${data.nombreCompleto}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),), 
                                                  Text("${data.matriculaId}"), 
                                                  Text("${data.carrDescripcion}"), 
                                              ],
                                            ),
                                          )
                                          
                                      ],
                                    ),

                                ),
                                
                                showEditIcon: false,
                                placeholder: false,
                              ) 
                            ],
                          ),
                    )
                    .toList()),
          );
  }
  

  @override
  Widget build(BuildContext context) {
    if (widget.estudiante.length>0){
        return bodyData();
    }

    return Container(
        margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Text("No existen registro!")
        );
    
  }
} 