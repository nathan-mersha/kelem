import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class CheckOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Checkout"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Check out page"),
        ),
      ),
    );
  }
}
