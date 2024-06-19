import 'package:flutter/material.dart';
import 'package:news_app/model/category_model/categoeryItemModel.dart';
import 'package:news_app/shared/reusable_widget/tabBar_Item.dart';
import 'package:news_app/ui/home/categories_widget/news_list_widget.dart';

import '../../shared/api/api_manager.dart';
class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key,required this.category});
  CategoryItemModel category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int  selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError || snapshot.data?.status == 'error'){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(snapshot.data?.message ?? snapshot.error.toString()),
              ElevatedButton(onPressed: () {}, child: Text("Try Again"))
            ],);
          }else {
            var sourcesList = snapshot.data?.sources??[];
            return DefaultTabController(
              initialIndex: selectedIndex,
              length: sourcesList.length,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(children: [
                  TabBar(
                    onTap: (index) {
                      selectedIndex = index;
                      setState((){});
                    },
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      isScrollable: true,
                      tabs: sourcesList.map((source){
                        return TabBarItem(source: source, isSelected: selectedIndex == sourcesList.indexOf(source));
                      }).toList()),
                  SizedBox(height: 5,),
                  NewsListWidget(source: sourcesList[selectedIndex]),
                ],),
              ),
            );
          }
        },);
  }
}
