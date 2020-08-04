import 'package:flutter/material.dart';
import 'package:kelemapp/widget/nav/menu.dart';

class ShopDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Shop Detail Page"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Shop detail page"),
        ),
      ),
    );
  }
}
