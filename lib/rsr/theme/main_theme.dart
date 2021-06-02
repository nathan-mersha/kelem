import 'package:flutter/material.dart';
import 'package:kelemapp/consetance/enums.dart';

class MainTheme {
  // static ThemeData getTheme() {
  //   return ThemeData(
  //       fontFamily: "Nunito",
  //       primaryColor: Colors.deepOrangeAccent,
  //       backgroundColor: Colors.white,
  //       buttonTheme: ButtonThemeData(buttonColor: Colors.deepOrangeAccent, textTheme: ButtonTextTheme.primary));
  // }

  static EdgeInsets getPagePadding() {
    return EdgeInsets.only(top: 10, bottom: 4, right: 10, left: 10);
  }
}

final appThemeData = {
  AppData.Light: ThemeData(
      fontFamily: "Nunito",
      primaryColor: Colors.deepOrangeAccent,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepOrangeAccent,
          textTheme: ButtonTextTheme.primary)),
  AppData.Dark: ThemeData(
      fontFamily: "Nunito",
      primaryColor: Colors.deepOrangeAccent,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepOrangeAccent,
          textTheme: ButtonTextTheme.primary)),
};
