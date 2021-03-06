import 'package:flutter/material.dart';
import 'package:probusaca/src/viewModels/DisponibilidadViewModel.dart';  



class cDataTableDisponibilidad extends StatefulWidget {
  final List<DisponibilidadViewModel> data;
  const cDataTableDisponibilidad({ Key key, this.data}): super(key: key);
  @override
  cDataTableDisponibilidadState createState() {
    return new cDataTableDisponibilidadState();
  }
}

class cDataTableDisponibilidadState extends State<cDataTableDisponibilidad> {


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
                        "Codigo",style: TextStyle(fontSize: 14.0,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    numeric: false, 
                    tooltip: "Codigo",
                  ),
                  DataColumn(
                    label: Text(
                        "Asignatura",
                        style: TextStyle(fontSize: 14.0,color: Colors.black,fontWeight: FontWeight.bold),),
                    numeric: false, 
                    tooltip: "Asignatura",
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
                                Text(data.codigo),
                                showEditIcon: false,
                                placeholder: false,
                              ),
                              DataCell(
                                Text("${data.asignatura}"),
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
                                      Text("Asignaturas que Puedo Impartir",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      wdata
                                  ],
                                ),
                  )
            ),
      );
  }
} 