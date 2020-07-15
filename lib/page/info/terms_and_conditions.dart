import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Terms and conditions"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Terms and conditions page"),
        ),
      ),
    );
  }
}
