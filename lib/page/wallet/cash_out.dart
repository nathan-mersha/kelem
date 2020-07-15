import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class CashOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Cashout"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Cash out page"),
        ),
      ),
    );
  }
}
