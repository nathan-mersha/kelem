import 'package:flutter/material.dart';
import 'package:kelemapp/widget/nav/menu.dart';

class ChangePasswordWalletSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Change Password"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Change password"),
        ),
      ),
    );
  }
}
