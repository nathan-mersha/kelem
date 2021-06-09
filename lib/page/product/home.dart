import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelemapp/api/config/global.dart';
import 'package:kelemapp/bloc/down/down_bloc.dart';
import 'package:kelemapp/bloc/internet/internet_bloc.dart';
import 'package:kelemapp/widget/nav/menu.dart';
import 'package:kelemapp/widget/nav/products_nav.dart';
import 'package:kelemapp/widget/product/bottom_sheet_product.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  bool noInternet = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ApiGlobalConfig.get();
    return Scaffold(
      key: _scaffoldKey,
      appBar: Menu.getAppBar(context, "Home", showCategory: true),
      drawer: Menu.getSideDrawer(context),
      backgroundColor: Theme.of(context).backgroundColor,
      body: MultiBlocListener(listeners: [
        BlocListener<DownBloc, DownState>(
          listener: (context, state) {
            // TODO: implement listener}
            if (state is DownSelected) {
              Scaffold.of(state.context).showBottomSheet(
                (context) {
                  print("${state.context.widget}");
                  return WillPopScope(
                    onWillPop: () {
                      BlocProvider.of<DownBloc>(context)
                          .add(DownUnSelectedEvent());
                      return Future.value(true);
                    },
                    child: Container(
                      height: 300,
                      child: Row(
                        children: [
                          buildProductViewSectionBottomSheet(
                              state.product, context),
                        ],
                      ),
                    ),
                  );
                },
                elevation: 3,
              );
            }
          },
        ),
        BlocListener<InternetBloc, InternetState>(
          listener: (context, state) {
            // TODO: implement listener}
            if (state is InternetWifiOrMobileState && noInternet) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "connection is back",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green,
                duration: Duration(milliseconds: 500),
              ));
            } else if (state is NoInternetState) {
              noInternet = true;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "No connection",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                duration: Duration(seconds: 60),
              ));
            }
          },
        ),
      ], child: ProductNavigation()),
    );
  }
}
