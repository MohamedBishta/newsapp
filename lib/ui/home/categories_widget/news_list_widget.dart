import 'package:flutter/material.dart';
import 'package:news_app/model/sources_Response/Source.dart';
import 'package:provider/provider.dart';

import '../../../shared/reusable_widget/news_widget.dart';
import '../../category_details/viewModel/CategoryDetailsViewModel.dart';
class NewsListWidget extends StatefulWidget {
   NewsListWidget({super.key,required this.source});
   Source source;
  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
   int page = 1;
   late ScrollController scrollController;
   @override
  void initState() {
     super.initState();
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       context.read<CategoryDetailsViewModel>().getNews(widget.source.id??"", page);
     });
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
    return Expanded(
      child: Consumer<CategoryDetailsViewModel>(builder: (BuildContext context, CategoryDetailsViewModel viewModel, Widget? child) {
        if(viewModel.showNewsLoading){
          return Center(child: CircularProgressIndicator(),);
        }else if(viewModel.newsErrorMessage != null){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(viewModel.newsErrorMessage??""),
              ElevatedButton(onPressed: () {}, child: Text("Try Again"))
            ],);
        }
        var articles = viewModel.newsList;
          if(articles.isEmpty){
            return Center(child: Text("No Sources Found"));
          }else{
            return ListView.separated(
                controller: scrollController,
                itemBuilder: (context, index) =>
                    News(article: articles[index],),
                separatorBuilder: (context, index) =>
                    SizedBox(height: 2.0,),
                itemCount: articles.length);
          }
        }
      ,),
    );
  }
}
