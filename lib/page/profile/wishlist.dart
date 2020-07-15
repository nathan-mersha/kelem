import 'package:flutter/material.dart';
import 'package:kelemapp/widget/menu.dart';

class WishListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Wishlist"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Center(
          child: Text("Wish list page"),
        ),
      ),
    );
  }
}
