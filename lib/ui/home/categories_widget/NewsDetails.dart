import 'package:flutter/material.dart';
import 'package:news_app/model/news_Response/Article.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/reusable_widget/news_search_delegate.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = "news_details";
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var article = ModalRoute.of(context)?.settings.arguments as Article ;
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.jpg"))),
      child: Scaffold(
        appBar: AppBar(title: Text(article.author??""),actions: [
          IconButton(onPressed: () {
             showSearch(context: context, delegate: NewsSearchDelegate());
          }, icon: Icon(Icons.search,size: 30,))
        ],),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(article.urlToImage??"",height:height* 0.3),
              Text(article.source?.name??"",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Color(0xff79828B)),),
              Text(article.title??"",style: TextStyle(fontWeight: FontWeight.w500),),
              Align(
                  alignment: Alignment.topRight,
                  child: Text(article.publishedAt??"",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Color(0xffA3A3A3)),)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(article.content??"",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xff42505C)),),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  launchNewsUrl(article.url??"");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Text("View Full Article",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.blue),),
                    Icon(Icons.arrow_forward_ios,size: 20,color: Colors.blue,),
                  ],),
                ),
              ),
            ],),
        ),
      ),
    );
  }
  Future<void> launchNewsUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
