import 'package:flutter/material.dart';
import 'package:kelemapp/widget/nav/menu.dart';

class ShopRatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Shop Rating"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Shop rating page"),
        ),
      ),
    );
  }
}
