import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelemapp/api/config/global.dart';
import 'package:kelemapp/bloc/down/down_bloc.dart';
import 'package:kelemapp/bloc/internet/internet_bloc.dart';
import 'package:kelemapp/route/route.dart';

import 'bloc/theme/theme_bloc.dart';

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
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    /// Creating an open socket connection to listen to global configuration object
    ApiGlobalConfig.get();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => DownBloc(),
        ),
        BlocProvider(
          create: (context) => InternetBloc(connectivity: Connectivity()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              title: "Kelem", theme: state.themeData, routes: routes);
        },
      ),
    );
  }
}
