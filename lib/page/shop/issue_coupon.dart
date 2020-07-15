import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class IssueCouponPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Issue coupon page"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Issue coupon page"),
        ),
      ),
    );
  }
}
