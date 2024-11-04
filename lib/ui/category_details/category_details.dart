import 'package:flutter/material.dart';
import 'package:news_app/model/category_model/categoeryItemModel.dart';
import 'package:news_app/shared/reusable_widget/tabBar_Item.dart';
import 'package:news_app/ui/category_details/viewModel/CategoryDetailsViewModel.dart';
import 'package:news_app/ui/home/categories_widget/news_list_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key,required this.category});
  CategoryItemModel category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int  selectedIndex = 0;
  int page = 1;
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if(scrollController.position.atEdge){
        if(scrollController.offset!=0){
          setState(() {
            page++;
            scrollController.jumpTo(0);
          });
        }
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CategoryDetailsViewModel()..getSources(widget.category.id),
      child: Consumer<CategoryDetailsViewModel>(builder: (BuildContext context, CategoryDetailsViewModel viewModel, Widget? child) {
        if(viewModel.showLoading){
          return Center(child: CircularProgressIndicator(),);
        }else if(viewModel.errorMessage != null){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(viewModel.errorMessage??""),
              ElevatedButton(onPressed: () {}, child: Text("Try Again"))
            ],);
        }
          var sourcesList = viewModel.sourcesList;
          return DefaultTabController(
            initialIndex: selectedIndex,
            length: sourcesList.length,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(children: [
                TabBar(
                    onTap: (index) {
                      setState((){
                        selectedIndex = index;
                        viewModel.getNews(sourcesList[selectedIndex].id??"", page);
                      });
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
      ,),
    );
  }
}
