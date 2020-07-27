import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData getTheme() {
    return ThemeData(
        fontFamily: "Nunito",
        primaryColor: Colors.deepOrangeAccent,
        buttonTheme: ButtonThemeData(buttonColor: Colors.deepOrangeAccent, textTheme: ButtonTextTheme.primary));
  }

  static EdgeInsets getPagePadding(){
    return EdgeInsets.symmetric(vertical: 10,horizontal: 15);
  }
}
