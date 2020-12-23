import 'package:flutter/material.dart'; 
import 'package:probusaca/src/page/components/itemCardDisponibilidad.dart';
import 'package:probusaca/src/viewModels/DisponibilidadViewModel.dart';  


class ListViewDisponiblidad extends StatelessWidget {
  final List<DisponibilidadViewModel>  result;
  
  const ListViewDisponiblidad({Key key,this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder( 
                itemBuilder: (context, index)=> itemCardDisponibilidad(
                                  itemIndex: index,
                                  data: result[index],
                                          press: () {
                                              // print("LLEGANDO");
                                          },
                            ), 
                itemCount: result.length
                );
  }
}