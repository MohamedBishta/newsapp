import 'package:flutter/material.dart';

import '../../../model/category_model/categoeryItemModel.dart';


class CategoryItem extends StatelessWidget {
  CategoryItemModel categoryItemModel;
  int index;
  CategoryItem({super.key,required this.categoryItemModel,required this.index});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.2,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: categoryItemModel.color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
              bottomRight: Radius.circular(index.isEven?24:0),
              bottomLeft: Radius.circular(index.isEven?0:24)
          )
      ),
      child: Column(
        children: [
          Image.asset("assets/images/${categoryItemModel.image}",height: height*0.1,
            fit: BoxFit.fitHeight,
            width: double.infinity,),
          SizedBox(
            height: 10,
          ),
          Text(
            categoryItemModel.title,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );;
  }
}
