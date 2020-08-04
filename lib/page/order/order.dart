import 'package:flutter/material.dart';
import 'package:kelemapp/widget/nav/menu.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Order"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Order page"),
        ),
      ),
    );
  }
}
