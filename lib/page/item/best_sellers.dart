import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class BestSellersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Best Sellers"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("best sellers page"),
        ),
      ),
    );
  }
}
