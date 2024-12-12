import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/DI/di.dart';
import 'package:news_app/shared/my_observer.dart';
import 'package:news_app/ui/home/categories_widget/NewsDetails.dart';
import 'package:news_app/shared/style/theme.dart';
import 'package:news_app/ui/home/home_screen.dart';



void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: AppTheme.light,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        NewsDetails.routeName: (_) => NewsDetails(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
