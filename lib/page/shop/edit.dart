import 'package:flutter/material.dart';
import 'package:kelemapp/widget/nav/menu.dart';

class EditShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Edit shop page"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("edit shop page"),
        ),
      ),
    );
  }
}
