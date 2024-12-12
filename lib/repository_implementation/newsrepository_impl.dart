
import 'package:injectable/injectable.dart';
import 'package:news_app/datasource_contract/news_datasource.dart';
import 'package:news_app/model/news_Response/Article.dart';
import 'package:news_app/model/sources_Response/Source.dart';
import 'package:news_app/repository_contract/news_repository.dart';
@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository{
  NewsDataSource apiDataSource ;
  @factoryMethod
  NewsRepositoryImpl(this.apiDataSource);
  @override
  Future<List<Source>> getSources(String categoryId) {
    return apiDataSource.getSources(categoryId);
  }

  @override
  Future<List<Article>> getNews(String sourceId) {
    return apiDataSource.getNews(sourceId);
  }
}