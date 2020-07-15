import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class PaymentAndDeliverySettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Payment & Delivery"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Payment and delivery"),
        ),
      ),
    );
  }
}
