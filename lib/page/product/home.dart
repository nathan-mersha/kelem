import 'package:flutter/material.dart';
import 'package:kelemapp/rsr/theme/main_theme.dart';
import 'package:kelemapp/widget/nav/menu.dart';
import 'package:kelemapp/widget/nav/products_nav.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: Menu.getAppBar(context, "Home", showCategory: true),
      drawer: Menu.getSideDrawer(context),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: MainTheme.getPagePadding(),
        child: ProductNavigation(),
      ),
    );
  }
}
