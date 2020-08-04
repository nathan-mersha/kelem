import 'package:flutter/material.dart';
import 'package:kelemapp/widget/nav/menu.dart';

class GeneralSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "General Settings"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("General Settings"),
        ),
      ),
    );
  }
}
