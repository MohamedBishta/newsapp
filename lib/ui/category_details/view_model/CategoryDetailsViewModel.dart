import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/datasource_contract/news_datasource.dart';
import 'package:news_app/datasource_implementation/news_api_datasource_impl.dart';
import 'package:news_app/repository_contract/news_repository.dart';
import 'package:news_app/repository_implementation/newsrepository_impl.dart';
import 'package:news_app/shared/api/api_manager.dart';
import '../../../model/news_Response/Article.dart';
import '../../../model/sources_Response/Source.dart';
@injectable
class CategoryDetailsViewModel extends Cubit<CategoryDetailsStates>{
  NewsRepository newsRepository;
  CategoryDetailsViewModel(this.newsRepository):super(CategoryDetailsInitState());

  getSources(String categoryId)async{
    try{
      var sourcesList = await newsRepository.getSources(categoryId);
      emit(SourcesSuccessState(sourcesList));
        emit(SourcesLoadingState());
    //   if(sourcesResponse.status == 'error'){
    //     emit(SourcesErrorState(sourcesResponse.message??""));
    //   }else {
    //     emit(SourcesSuccessState(sourcesResponse.sources??[]));
    //   }
    }catch(error){
      emit(SourcesErrorState(error.toString()));
    }
  }

  getNews(String sourceId,[ int? page])async{
    try{
      var newsList = await newsRepository.getNews(sourceId);
        emit(NewsSuccessState(newsList));
      // emit(NewsLoadingState());
      // if(newsResponse.status == 'error'){
      //   emit(NewsErrorState(newsResponse.message??""));
      // }else{
      //   emit(NewsSuccessState(newsResponse.articles??[]));
      // }
    }
    catch(error){
      emit(NewsErrorState(error.toString()));
    }
  }

}

abstract class CategoryDetailsStates {}

class CategoryDetailsInitState extends CategoryDetailsStates{}

class SourcesLoadingState extends CategoryDetailsStates{}
class SourcesErrorState extends CategoryDetailsStates{
  String errorMessage ;
  SourcesErrorState(this.errorMessage);
}
class SourcesSuccessState extends CategoryDetailsStates{
  List<Source> sources ;
  SourcesSuccessState(this.sources);
}
class NewsLoadingState extends CategoryDetailsStates{}
class NewsErrorState extends CategoryDetailsStates{
  String errorMessage;
  NewsErrorState(this.errorMessage);
}
class NewsSuccessState extends CategoryDetailsStates{
  List<Article> news;
  NewsSuccessState(this.news);
}