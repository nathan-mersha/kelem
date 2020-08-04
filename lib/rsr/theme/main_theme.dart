import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData getTheme() {
    return ThemeData(
        fontFamily: "Nunito",
        primaryColor: Colors.deepOrangeAccent,
        backgroundColor: Colors.white,
        buttonTheme: ButtonThemeData(buttonColor: Colors.deepOrangeAccent, textTheme: ButtonTextTheme.primary));
  }

  static EdgeInsets getPagePadding() {
    return EdgeInsets.only(top: 10, bottom: 4, right: 10, left: 10);
  }
}
