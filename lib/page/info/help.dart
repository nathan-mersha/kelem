import 'package:flutter/material.dart';
import 'package:kelemapp/widget/nav/menu.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Help"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text(" help page"),
        ),
      ),
    );
  }
}
