import 'package:flutter/material.dart'; 
import 'package:probusaca/src/page/components/ItemCardProfSession.dart';  
import 'package:probusaca/src/viewModels/ProfSessionesViewModel.dart'; 


class ListViewProfSessiones extends StatelessWidget {
  final List<ProfSessionesViewModel>  result;
  final Function press;
  
  const ListViewProfSessiones({Key key,this.result,this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder( 
                itemBuilder: (context, index)=> ItemCardProfSession(itemIndex: index,data: result[index],press: press,), 
                itemCount: result.length
                );
  }
}