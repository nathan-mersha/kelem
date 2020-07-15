import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Cart"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Cart page"),
        ),
      ),
    );
  }
}
