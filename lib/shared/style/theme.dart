import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xff39A552),
      primary: Color(0xff39A552),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff39A552),
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize:22 ,fontWeight:FontWeight.w400 ,color: Colors.white),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
    ),
    useMaterial3: true,
  );
}
