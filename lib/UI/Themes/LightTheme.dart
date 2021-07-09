import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/UI/constants.dart';

class LightTheme{
  static ThemeData get lightTheme{
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blue,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize:23,
          fontWeight: FontWeight.normal,
          color: Colors.grey[600],
          //fontFamily: 'Amira'
        ),
        headline4: TextStyle(
          fontSize: 30,
          //fontWeight: FontWeight.w600,
          color: PrimaryColor,
          fontFamily: 'Bir',
        ),
        bodyText2: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        headline6: TextStyle(
          fontSize: 18,
          color: Colors.grey[700],
          fontWeight: FontWeight.w600,
        ),
      ),
    );

  }
}