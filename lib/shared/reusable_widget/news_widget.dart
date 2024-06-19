import 'package:flutter/material.dart';
import 'package:news_app/model/news_Response/Article.dart';
import 'package:news_app/ui/home/categories_widget/NewsDetails.dart';

class News extends StatelessWidget {
  News({super.key,required this.article});

  Article article;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName,arguments: article);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Image.network(article.urlToImage??"",height:height* 0.3),
          Text(article.source?.name??"",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Color(0xff79828B)),),
          Text(article.title??"",style: TextStyle(fontWeight: FontWeight.w500),),
          Align(
            alignment: Alignment.topRight,
              child: Text(article.publishedAt??"",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Color(0xffA3A3A3)),))
        ],),
      ),
    );
  }
}
