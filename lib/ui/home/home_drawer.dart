import 'package:flutter/material.dart';
typedef MenuItemCilck = void Function(MenuItem item);
class HomeDrawer extends StatelessWidget {
  MenuItemCilck itemCilck;
   HomeDrawer({super.key,required this.itemCilck});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          padding: EdgeInsets.all(50),
          color: Theme.of(context).primaryColor,
            width: double.infinity,
            child: Text("News App!",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24),textAlign: TextAlign.center)),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                itemCilck(MenuItem.categories);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                Icon(Icons.view_list,size: 30,),
                SizedBox(width: 10,),
                Text("Categories",style: TextStyle(fontSize: 24),)
              ],),
            ),
          ) ,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                itemCilck(MenuItem.settings);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                Icon(Icons.settings,size: 30,),
                SizedBox(width: 10,),
                Text("Settings",style: TextStyle(fontSize: 24),)
              ],),
            ),
          )

      ],),
    );
  }
}
enum MenuItem {
  categories,
  settings
}
