import 'dart:ui';

class CategoryItemModel {
  String id;
  String title;
  String image;
  Color color;

  CategoryItemModel({required this.id,required this.title,required this.image,required this.color});

  static List <CategoryItemModel> category = [
    CategoryItemModel(id: "sports", title: "Sports", image: "sports.png", color: Color(0xffe51f1f)),
    CategoryItemModel(id: "general", title: "Politics", image: "Politics.png", color: Color(0xff2a57ee)),
    CategoryItemModel(id: "health", title: "Health", image: "health.png", color: Color(0xfffc00e5)),
    CategoryItemModel(id: "business", title: "Business", image: "business.png", color: Color(0xff541a1a)),
    CategoryItemModel(id: "science", title: "Environment", image: "environment.png", color: Color(0xff2daede)),
    CategoryItemModel(id: "technology", title: "Technology", image: "science.png", color: Color(0xfff1c229)),
  ];
}