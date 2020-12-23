import 'package:flutter/material.dart';
import 'package:probusaca/src/utilities/constants.dart';
import 'package:probusaca/src/viewModels/BalanceEstudianteViewModel.dart';
import 'package:probusaca/src/viewModels/ProfesorViewModel.dart';

class BalanceEstudianteCard extends StatelessWidget {
  const BalanceEstudianteCard({
    Key key,
    this.data,
    this.press,
  }) : super(key: key);

  final BalanceEstudianteViewModel data;
  final Function press;

  @override
  Widget build(BuildContext context) {
    int itemIndex = 0;
    // It  will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: itemIndex == 0 ? 0 : kDefaultPadding / 2,
      ),
      // color: Colors.blueAccent,
      height: 140,
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Those are our background
            Container(
              height: 120,
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
            // our product image
            Positioned(
              top: 0,
              right: -40,
              child: Hero(
                tag: '${data.nombreCompleto}',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 80,
                  // image is square but we add extra 20 + 20 padding thats why width is 200
                  width: 200,
                  //child: Icon(Icons.supervised_user_circle, color: Colors.green,size: 100,),//Image.asset( product.image, fit: BoxFit.cover, ),
                  child: Image.asset(
                    "assets/images/person3.png",
                    fit: BoxFit.scaleDown,
                    width: 50,
                    height: 80,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 200,
                width: size.width - 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Container(
                      height: 85,
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            data.nombreCompleto,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            data.matricula,
                            style: Theme.of(context).textTheme.button,
                          ),
                          SizedBox(
                            height: 4,
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
                        "Balance: ${data.monedaEstudiante} ${data.balance}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
