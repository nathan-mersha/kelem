import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Signin"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Sign in page"),
        ),
      ),
    );
  }
}
