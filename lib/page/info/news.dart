import 'package:flutter/material.dart';
import 'package:kelemapp/widget/nav/menu.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "News page"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("News page"),
        ),
      ),
    );
  }
}
