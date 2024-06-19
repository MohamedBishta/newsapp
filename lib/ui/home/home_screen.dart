import 'package:flutter/material.dart';
import 'package:news_app/ui/category_details/category_details.dart';
import 'package:news_app/ui/home/settings_widget/settings.dart';

import '../../model/category_model/categoeryItemModel.dart';

import 'categories_widget/categories.dart';
import 'home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    selectedWidget = Categories(categoryClick: CategoryItemClick );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.jpg"))),
      child: Scaffold(
        appBar: AppBar(title: Text("News App")),
        drawer: HomeDrawer(itemCilck: MenuItemClick),
        body: selectedWidget,
      ),
    );
  }

  late Widget selectedWidget ;

  void MenuItemClick(MenuItem item){
    switch (item){
      case MenuItem.categories:
        selectedWidget = Categories(categoryClick: CategoryItemClick ,);
        setState(() {

        });
        break;
      case MenuItem.settings:
        selectedWidget = Settings();
        setState(() {

        });
        break;
    }

  }
  void CategoryItemClick(CategoryItemModel category){
    selectedWidget = CategoryDetails(category: category,);
    setState(() {

    });
  }
}

