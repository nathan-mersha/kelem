import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class ItemEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Item edit"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Item edit page"),
        ),
      ),
    );
  }
}
