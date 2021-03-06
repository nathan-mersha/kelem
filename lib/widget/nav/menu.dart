import 'package:flutter/material.dart';
import 'package:kelemapp/rsr/theme/color.dart';
import 'package:kelemapp/widget/nav/category_menu.dart';

import '../../route/route.dart';

class Menu {
  /// Get menu side drawer
  static getSideDrawer(BuildContext context) {
    return Drawer(

        child: ListView(
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  "assets/images/icon_primary_color.png",
                  height: 70,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Kelem market",
                  style: TextStyle(color: CustomColor.GRAY_LIGHT),
                ),
                Text(
                  "www.kelem.com",
                  style: TextStyle(color: CustomColor.GRAY),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {
            // todo : navigate to home
          },
        ),
        ListTile(
          leading: Icon(Icons.explore),
          title: Text("News"),
          subtitle: Text("Select from categories"),
          onTap: () {
            // todo : navigate
          },
        ),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text("Shop"),
          subtitle: Text("Visit online shops"),
          onTap: () {
            // todo : navigate
          },
        ),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text("Wallet"),
          subtitle: Text("Your wallet here"),
          onTap: () {
            // todo : navigate
          },
        ),
        ListTile(
          leading: Icon(Icons.local_play),
          title: Text("Wish list"),
          subtitle: Text("Anything new?"),
          onTap: () {
            Navigator.pushNamed(context, RouteTo.PROFILE_WISH_LIST);

            // todo : navigate
          },
        ),
        ListTile(
          leading: Icon(Icons.local_mall),
          title: Text("Orders"),
          subtitle: Text("View your order here"),
          onTap: () {
            // todo : navigate
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text("Best Sellers"),
          subtitle: Text("Customize your profile here"),
          onTap: () {
            // todo : navigate
          },
        ),
        Divider(indent: 15.0, height: 2, color: Theme.of(context).dividerColor),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: () {
            Navigator.pop(context);
            // todo : go to settings page here
          },
        ),
        Divider(indent: 15.0, height: 2, color: Theme.of(context).dividerColor),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text("Cart"),
          subtitle: Text("Anything you want?"),
          onTap: () {
            // todo : navigate to wish list page here
          },
        ),
        ListTile(
          leading: Icon(Icons.send),
          title: Text("Contact us"),
          subtitle: Text("What's on your mind."),
          onTap: () {
            Navigator.pop(context); // Pops the navigation side drawer
            // todo : do contact us here
          },
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text("Share"),
          subtitle: Text("Share the app with friends"),
          onTap: () {
            // todo : share here
          },
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text("Help"),
          subtitle: Text("What can we help you with?"),
          onTap: () {
            Navigator.pop(context); // Pops the navigation side drawer
            // todo : help page here.
          },
        ),
      ],
    ));
  }

  static getAppBar(BuildContext context, String title, {bool showCategory = false}) {
    return AppBar(
      actions: <Widget>[showCategory ? CategoryMenu() : Container()],
      title: Text(title),
      centerTitle: true,
      elevation: 20.0,
    );
  }
}
