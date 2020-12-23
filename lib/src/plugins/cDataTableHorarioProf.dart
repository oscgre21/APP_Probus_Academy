import 'package:flutter/material.dart'; 
import 'package:probusaca/src/viewModels/HorarioProfesorViewModel.dart';



class cDataTableHorarioProf extends StatefulWidget {
  final List<HorarioProfesorViewModel> data;
  const cDataTableHorarioProf({ Key key, this.data}): super(key: key);
  @override
  cDataTableHorarioProfState createState() {
    return new cDataTableHorarioProfState();
  }
}

class cDataTableHorarioProfState extends State<cDataTableHorarioProf> {


  Widget bodyData() {
  
    return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                onSelectAll: (b) {},
                sortColumnIndex: 1,
                sortAscending: true,
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                        "Hora desde",style: TextStyle(fontSize: 14.0,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    numeric: false, 
                    tooltip: "Hora desde",
                  ),
                  DataColumn(
                    label: Text(
                        "Hora hasta",
                        style: TextStyle(fontSize: 14.0,color: Colors.black,fontWeight: FontWeight.bold),),
                    numeric: false, 
                    tooltip: "Hora hasta",
                  ), 
                  DataColumn(
                    label: Text(
                        "Recinto",
                        style: TextStyle(fontSize: 14.0,color: Colors.black,fontWeight: FontWeight.bold),),
                    numeric: false, 
                    tooltip: "Recinto",
                  )
                ],
                rows: widget.data
                    .map(
                      (data) => DataRow(
                            cells: [
                              DataCell(
                                Text(data.horaDesde),
                                showEditIcon: false,
                                placeholder: false,
                              ),
                              DataCell(
                                Text("${data.horaHasta}"),
                                showEditIcon: false,
                                placeholder: false,
                              ), 
                              DataCell(
                                Text(data.recinto),
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
    if (widget.data.length>0){
        return _getNormalCard(context,bodyData());
    }

    return _getNormalCard(context,Container(
        margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Text("No existen registro!")
        ));
    
  }

    Widget _getNormalCard(context,Widget wdata){
      return Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Card(  
                  child: Container(
                         margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                         child: Column (  
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                      Text("Disponibilidad de Horario",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      wdata
                                  ],
                                ),
                  )
            ),
      );
  }
} 