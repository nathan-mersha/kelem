import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class VersionAndUpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Version and update"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Version and update page"),
        ),
      ),
    );
  }
}
