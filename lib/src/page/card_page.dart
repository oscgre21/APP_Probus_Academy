import 'package:flutter/material.dart';
import 'package:probusaca/src/providers/ListadoProvider.dart';



class CardPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar( title: Text("Tarjeta List View"),),
        body: _getBody(),
    );
  }

  Widget _getBody(){

      return FutureBuilder(
        future: listadoProvider.cargarLista(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) { 
          return ListView( 
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  children:  _createListItem(context,snapshot.data)
              );
        },
      );
  }

  List<Widget> _createListItem(context,List<dynamic> data){
      final List<Widget> opciones = [];
      
      data.forEach((f){   
        print(f);
        if (f['ruta']!="alert"){
            opciones.add(_getNormalCard(context,f));
        }else{
            opciones.add(_getNormalCard2(context,f) );
        }
        
            
      });

      return opciones;
  }

  Card _getNormalCard(context,f){
      return Card( 
                child: Column (  
                  children: <Widget>[
                      ListTile(
                            title: Text(f['texto']),
                            subtitle:  Text("Subitulo Subitulo Subitulo Subitulo Subitulo Subitulo Subitulo Subitulo Subitulo Subitulo Subitulo Subitulo Subitulo Subitulo Subitulo Subitulo "),
                            leading: Icon(Icons.account_circle) ,
                            trailing: Icon(Icons.navigate_next),
                            onTap: (){
                                Navigator.pushNamed(context, "newpage"); 
                            },
                          ), 
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              child: Text("Cancel"),
                              onPressed: (){},
                            ),
                            FlatButton(
                                child: Text("Ok"),
                                onPressed: (){},
                            )
                          ],
                      )
                  ],
                )
          );
  }

  Card _getNormalCard2(context,f){
      return Card( 
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 4.0,
                child: Column (  
                  children: <Widget>[
                      FadeInImage(
                          fit: BoxFit.cover,
                          height: 150,
                          placeholder:  AssetImage('assets/jar-loading.gif') ,
                          fadeInDuration: Duration(milliseconds: 200),
                          image: NetworkImage("https://lacf.ca/sites/default/files/images/homepage/banners/P14%20-%20brightcropped%20for%20landing%20page_%20Bridge%20in%20Gablenz%2C%20Germany%2C%20Photo%20by%20Martin%20Damboldt%20from%20Pexels.jpg"),
                      ),
                      //Image( image: NetworkImage("https://lacf.ca/sites/default/files/images/homepage/banners/P14%20-%20brightcropped%20for%20landing%20page_%20Bridge%20in%20Gablenz%2C%20Germany%2C%20Photo%20by%20Martin%20Damboldt%20from%20Pexels.jpg"),), 
                      Container(child: Text("Imagen cargada!"), padding: EdgeInsets.all(10.0),),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              child: Text("Cancel"),
                              onPressed: (){   Navigator.of(context).pop(); },
                            ),
                            FlatButton(
                                child: Text("Ok"),
                                onPressed: (){},
                            ),
                            RaisedButton(
                              child: Text("Mostrar alerta"),
                              color: Colors.red,
                              textColor: Colors.white,
                              shape: StadiumBorder(),
                              onPressed: ()=>_mostrarAlerta(context),
                            )
                          ],
                      )
                  ],
                )
          );
  }
  
   void _mostrarAlerta(BuildContext context){ 
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
           return AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                title: Text("Alerta!"),
                content: Expanded(
                        child: Row(   
                                  mainAxisSize: MainAxisSize.min ,
                                  children: <Widget>[
                                        Text("Contenido mayor"),
                                  ],
                            ),
                ),
              
                actions: <Widget>[
                      FlatButton(
                          child: Text("Cancelar"),
                          onPressed: ()=> Navigator.of(context).pop(),
                      ),
                      FlatButton(
                          child: Text("Ok"),
                          onPressed: ()=> Navigator.of(context).pop(),
                      )
                ],
           );
        },
      
      );
   }
}
 