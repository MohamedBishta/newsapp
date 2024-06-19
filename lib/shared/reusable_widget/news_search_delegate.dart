import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import 'news_widget.dart';

class NewsSearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {
      showResults(context);
    }, icon: Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.of(context).pop();
    }, icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: FutureBuilder(future: ApiManager.getNewsSearch(query),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: FutureBuilder(future: ApiManager.getNewsSearch(query),
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