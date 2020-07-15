import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Home"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("home page"),
        ),
      ),
    );
  }
}
