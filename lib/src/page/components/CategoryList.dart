import 'package:flutter/material.dart';
import 'package:probusaca/src/utilities/constants.dart'; 

class CategoryList extends StatefulWidget {
  Function _press;
  CategoryList(Function press) {
    this._press = press;
  }

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // by default first item will be selected
  int selectedIndex = 0;
 
  List categories = ['Información General', 'Horario', 'Histórico de Notas', 'Balance', 'Documentación'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              widget._press.call(categories[index]);
              print(selectedIndex);
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: index == 0?0:kDefaultPadding,
              // At end item it add extra 20 right  padding
              right: index == categories.length - 1 ? kDefaultPadding : 0,
            ),
            padding: EdgeInsets.only(left: index == 0?8:kDefaultPadding,right: index == categories.length - 1 ? kDefaultPadding : 8,),// symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? Colors.white.withOpacity(0.4)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              categories[index],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}