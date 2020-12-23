import 'package:flutter/material.dart'; 
import 'package:probusaca/src/utilities/constants.dart';
import 'package:probusaca/src/viewModels/AsignaturaViewModel.dart'; 
 
class ItemCardAsignatura extends StatelessWidget {
  const ItemCardAsignatura({
    Key key,
    this.itemIndex,
    this.asignatura,
    this.press,
  }) : super(key: key);

  final int itemIndex;
  final AsignaturaViewModel asignatura;
  final Function press;


  @override
  Widget build(BuildContext context) {
    // It  will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: itemIndex==0?0: kDefaultPadding / 2,
      ),
      // color: Colors.blueAccent,
      height: 180,
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Those are our background
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: itemIndex.isEven ? kBlueColor : kSecondaryColor,
                boxShadow: [kDefaultShadow],
              ),
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ), 
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(  
                height: 250, 
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(), 
                    Container(
                        height:115,
                        margin: EdgeInsets.only(left: 10), 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              asignatura.asignatura,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
                            ),
                            SizedBox(height: 4,),
                            Text(
                              asignatura.codigo,
                              style: Theme.of(context).textTheme.button,
                            ),
                            SizedBox(height: 4,),
                            Text(
                              asignatura.seccion,
                              style: Theme.of(context).textTheme.button,
                            ),
                            SizedBox(height: 4,),
                            Text(
                              "${asignatura.cr}",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ],
                        ),
                    ), 
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 1.5, // 30 padding
                        vertical: kDefaultPadding / 4, // 5 top and bottom
                      ),
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                      child: Text(
                        "Seccion: ${asignatura.seccion}",
                        style: TextStyle(fontSize: 14.0,color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
