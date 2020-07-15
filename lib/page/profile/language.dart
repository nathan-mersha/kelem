import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Language"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("language page"),
        ),
      ),
    );
  }
}
