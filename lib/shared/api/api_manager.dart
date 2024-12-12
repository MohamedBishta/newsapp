import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news_app/model/news_Response/NewsResponse.dart';
import 'package:news_app/model/sources_Response/SourcesResponse.dart';
@singleton
class ApiManager{

  static const String apiKey = '93d6f4d03afb4dd29c1f21864bc8d58d';
  static const String baseUrl = 'newsapi.org';
  
  
   Future<SourcesResponse> getSources(String categoryId) async{
    var url = Uri.https(baseUrl,"/v2/top-headlines/sources",{
      "apiKey": apiKey,
      "category": categoryId,
    });
    var response = await http.get(url);
    var json =  jsonDecode(response.body);
    var sourceResponse = SourcesResponse.fromJson(json);
    return sourceResponse ;
  }

   Future<NewsResponse> getNews(String sourceId,[int? page]) async {
    var url =Uri.https(baseUrl,"/v2/everything",{
      "apiKey": apiKey,
      "sources": sourceId,
      "page":page.toString(),
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse ;

  }

  static Future<NewsResponse> getNewsSearch(String query) async {
    var url =Uri.https(baseUrl,"/v2/everything",{
      "apiKey": apiKey,
      "q": query,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse ;

  }
}
