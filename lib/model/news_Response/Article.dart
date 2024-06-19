import '../sources_Response/Source.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "Andrew Barton"
/// title : "Thousands of school children in Yorkshire given CPR lessons"
/// description : "Restart a Heart Day is teaching 35,000 school children life-saving skills at 172 secondary schools."
/// url : "https://www.bbc.co.uk/news/articles/c3wp0pw39xzo"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/1704/live/9492ad50-8ae1-11ef-b6b0-c9af5f7f16e4.jpg"
/// publishedAt : "2024-10-16T07:12:34Z"
/// content : "Meanwhile, Karen Jenner, 63, from Leeds, has raised £2,500 for YAS after an ambulance crew saved her life by administering CPR when she had a heart attack.\r\n\"I was down for two minutes while they res… [+513 chars]"

class Article {
  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}