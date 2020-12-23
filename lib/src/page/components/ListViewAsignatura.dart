import 'package:flutter/material.dart';
import 'package:probusaca/src/page/components/ItemCardAsignatura.dart'; 
import 'package:probusaca/src/viewModels/AsignaturaViewModel.dart'; 


class ListViewAsignatura extends StatelessWidget {
  final List<AsignaturaViewModel>  result;
  
  const ListViewAsignatura({Key key,this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder( 
                itemBuilder: (context, index)=> ItemCardAsignatura(
                                  itemIndex: index,
                                  asignatura: result[index],
                                          press: () {
                                              // print("LLEGANDO");
                                          },
                            ), 
                itemCount: result.length
                );
  }
}