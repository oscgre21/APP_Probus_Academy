import 'package:flutter/material.dart';
import 'package:probusaca/src/page/components/ItemCardHistorialNotas.dart';  
import 'package:probusaca/src/viewModels/HistoricoNotasViewModel.dart'; 


class ListViewHistorialNotas extends StatelessWidget {
  final List<HistoricoNotasViewModel>  result;
  
  const ListViewHistorialNotas({Key key,this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder( 
                itemBuilder: (context, index)=> ItemCardHistorialNotas(
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