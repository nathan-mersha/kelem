import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class WalletDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Wallet"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Wallet dashboard page"),
        ),
      ),
    );
  }
}
