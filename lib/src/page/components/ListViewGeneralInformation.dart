import 'package:flutter/material.dart'; 
import 'package:probusaca/src/page/components/ItemsCard.dart';
import 'package:probusaca/src/viewModels/EstudianteViewModel.dart';


class ListViewGeneralInformation extends StatelessWidget {
  final List<EstudianteViewModel>  result;
  
  const ListViewGeneralInformation({Key key,this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder( 
                itemBuilder: (context, index)=> ItemsCard(
                                  itemIndex: index,
                                  estudiante: result[index],
                                          press: () {
                                              // print("LLEGANDO");
                                          },
                            ), 
                itemCount: result.length
                );
  }
}