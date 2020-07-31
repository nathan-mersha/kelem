import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kelemapp/api/config/global.dart';
import 'package:kelemapp/rsr/theme/main_theme.dart';
import 'route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static var routes;

  @override
  Widget build(BuildContext context) {
    routes = RouteTo().routes;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    ApiGlobalConfig.get();
    return MaterialApp(title: "Kelem", theme: MainTheme.getTheme(), routes: routes);
  }
}
