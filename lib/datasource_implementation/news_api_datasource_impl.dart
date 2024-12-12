
import 'package:injectable/injectable.dart';
import 'package:news_app/model/news_Response/Article.dart';
import 'package:news_app/model/sources_Response/Source.dart';
import 'package:news_app/shared/api/api_manager.dart';

import '../datasource_contract/news_datasource.dart';
@Injectable(as: NewsDataSource)
class NewsApiDataSourceImpl extends NewsDataSource{
  ApiManager apiManager;
  @factoryMethod
  NewsApiDataSourceImpl(this.apiManager);
  @override
  Future<List<Source>> getSources(String categoryId) async{
    var sourcesResponse =  await apiManager.getSources(categoryId);
    return sourcesResponse.sources??[];
  }

  @override
  Future<List<Article>> getNews(String sourceId) async {
    var newsResponse = await apiManager.getNews(sourceId);
    return newsResponse.articles??[];
  }
  
}