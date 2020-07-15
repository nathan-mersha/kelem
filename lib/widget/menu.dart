import 'package:flutter/material.dart';

class Menu {

  /// Get menu side drawer
  static getSideDrawer(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        Divider(
          color: Colors.black26,
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {
            // todo : navigate to home
          },
        ),
        ListTile(
          leading: Icon(Icons.category),
          title: Text("Category"),
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
          leading: Icon(Icons.notifications_active),
          title: Text("Notifications"),
          subtitle: Text("Anything new?"),
          onTap: () {
            // todo : navigate
          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Profile"),
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
          leading: Icon(Icons.bubble_chart),
          title: Text("Wish list"),
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

  /// Get menu app bar
  static getAppBar(BuildContext context, String title) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 20.0,
    );
  }
}
