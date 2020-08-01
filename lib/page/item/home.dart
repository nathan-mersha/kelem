import 'package:flutter/material.dart';
import 'package:kelemapp/rsr/theme/color.dart';
import 'package:kelemapp/rsr/theme/main_theme.dart';
import 'package:kelemapp/widget/category_menu.dart';
import 'package:kelemapp/widget/loading.dart';
import 'package:kelemapp/widget/menu.dart';
import 'package:kelemapp/widget/no_internet.dart';
import 'package:kelemapp/widget/product_tab_view.dart';

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
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[getSearchView(), ProductTabView()],
        ),
      ),
    );
  }

  Widget getSearchView() {
    return Card(
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.only(
            left: 15,
          ),
          hintText: "search",
        ),
        maxLines: 1,
        autocorrect: true,
      ),
    );
  }
}
