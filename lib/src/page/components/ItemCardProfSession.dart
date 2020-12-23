import 'package:flutter/material.dart'; 
import 'package:probusaca/src/viewModels/ProfSessionesViewModel.dart'; 
 
class ItemCardProfSession extends StatelessWidget {
  const ItemCardProfSession({
    Key key,
    this.itemIndex,
    this.data,
    this.press,
  }) : super(key: key);

  final int itemIndex;
  final ProfSessionesViewModel data;
  final Function press;


  @override
  Widget build(BuildContext context) {
    // It  will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return _getNormalCard(context);
  }
 
  Widget _getNormalCard(context){ 
      return Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: GestureDetector(
                  onTap: (){
                    press(data);
                  },
                  child: Card(  
                    child: Container(
                           margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                           child: Column (  
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container( 
                                          margin: EdgeInsets.only(left: 10), 
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                data.asigDescripcion,
                                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
                                              ),
                                              SizedBox(height: 15,),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "SESSION",
                                                    style: TextStyle(fontSize: 14.0,color: Colors.black,fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(width: 24,),
                                                  Text(
                                                    "PERIODO",
                                                    style: TextStyle(fontSize: 14.0,color: Colors.black,fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(width: 24,),
                                                  Text(
                                                    "TIPO",
                                                    style: TextStyle(fontSize: 14.0,color: Colors.black,fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "${data.seccionId}",
                                                    style: Theme.of(context).textTheme.button,
                                                  ), 
                                                  Container(
                                                     margin: EdgeInsets.symmetric(horizontal: 35),
                                                     child: Text(
                                                      "${data.periodoNombre}",
                                                      style: Theme.of(context).textTheme.button,
                                                    ),
                                                  ), 
                                                  Container(
                                                     margin: EdgeInsets.symmetric(horizontal: 0),
                                                     child: Text(
                                                      "${data.tiSeDescripcion}",
                                                      style: Theme.of(context).textTheme.button,
                                                    ),
                                                  ), 
                                                ],
                                              ), 
                                            ],
                                          ),
                                      ),  
                                      SizedBox(height: 10,),

                                      //cDatatableSessiones(estudiante: data.listadoEstudiantesSession,)
                                    ],
                                  ),
                    )
            ),
              ),
      );
  }

}
