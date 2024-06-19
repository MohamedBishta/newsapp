import 'package:flutter/material.dart';

import '../../../model/category_model/categoeryItemModel.dart';
import 'category_item.dart';

typedef onCategoryClick = void Function(CategoryItemModel categoryItemModel);
class Categories extends StatelessWidget {
  onCategoryClick categoryClick;
  Categories({super.key,required this.categoryClick});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick your category \nof interest",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              itemCount: CategoryItemModel.category.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 25, mainAxisSpacing: 25),
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  categoryClick(CategoryItemModel.category[index]);
                },
                  child: CategoryItem(categoryItemModel: CategoryItemModel.category[index], index: index ,)),
            ),
          ),
        ],
      ),
    );
  }
}
