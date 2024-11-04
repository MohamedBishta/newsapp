import 'package:flutter/material.dart';
import 'package:news_app/model/sources_Response/Source.dart';
import 'package:news_app/shared/api/api_manager.dart';
import '../../../model/news_Response/Article.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  String? errorMessage;
  List<Source> sourcesList = [];
  bool showLoading = false;
  getSources(String categoryId) async {
    showLoading = true;
    notifyListeners();
    try {
      var sourceResponse = await ApiManager.getSources(categoryId);
      showLoading = false;
      if (sourceResponse.status == 'error') {
        //   handel error
        errorMessage = sourceResponse.message;
      } else {
        //   handel success
        sourcesList = sourceResponse.sources ?? [];
      }
      notifyListeners();
    } catch (error) {
      showLoading = false;
      errorMessage = error.toString();
      notifyListeners();
    }
  }

  String? newsErrorMessage;
  List<Article> newsList = [];
  bool showNewsLoading = false;
  getNews(String sourceId ,int page) async {
   showNewsLoading = true;
   notifyListeners();
   try{
     var newsResponse = await ApiManager.getNews(sourceId, page);
     showNewsLoading = false;
     if(newsResponse.status == 'error'){
       newsErrorMessage = newsResponse.message;
     }else{
       newsList = newsResponse.articles ??[];
     }
     notifyListeners();
   }catch(error){
     showNewsLoading = false;
     newsErrorMessage = error.toString();
     notifyListeners();
   }
  }
}
