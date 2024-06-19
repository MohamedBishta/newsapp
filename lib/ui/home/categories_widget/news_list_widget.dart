import 'package:flutter/material.dart';
import 'package:news_app/model/sources_Response/Source.dart';
import 'package:news_app/shared/api/api_manager.dart';

import '../../../shared/reusable_widget/news_widget.dart';
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
      child: FutureBuilder(future: ApiManager.getNews(widget.source.id!,page),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }else if(snapshot.hasError || snapshot.data?.status == 'error'){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(snapshot.data?.message??snapshot.error.toString()),
            ElevatedButton(onPressed: () {}, child: Text("Try Again"))
          ],);
        }else{
          var articles = snapshot.data?.articles??[];
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
        },),
    );
  }
}
