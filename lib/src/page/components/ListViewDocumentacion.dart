import 'package:flutter/material.dart'; 
import 'package:probusaca/src/viewModels/DocumentacionViewModel.dart';

import 'ItemCardDocument.dart';   


class ListViewDocumentacion extends StatelessWidget {
  final List<DocumentacionViewModel>  result;
  
  const ListViewDocumentacion({Key key,this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // print("Tamaño : ${result.length}");
    return ListView.builder( 
                itemBuilder: (context, index)=> ItemCardDocument(
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