import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Contact us"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text(" contact us page"),
        ),
      ),
    );
  }
}
