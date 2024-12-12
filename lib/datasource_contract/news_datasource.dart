
import 'package:news_app/model/news_Response/Article.dart';
import 'package:news_app/model/sources_Response/Source.dart';

abstract class NewsDataSource{
  Future<List<Source>> getSources(String categoryId);
  Future<List<Article>> getNews(String sourceId);
}