import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelemapp/bloc/theme/theme_bloc.dart';
import 'package:kelemapp/bloc/user/user_bloc.dart';
import 'package:kelemapp/consetance/enums.dart';
import 'package:kelemapp/rsr/theme/color.dart';
import 'package:kelemapp/widget/nav/category_menu.dart';

import '../../route/route.dart';

class Menu {
  /// Get menu side drawer
  static bool isDark = false;
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
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: Icon(Icons.explore),
          title: Text("News"),
          subtitle: Text("Select from categories"),
          onTap: () {
            // todo : navigate
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text("Shop"),
          subtitle: Text("Visit online shops"),
          onTap: () {
            // todo : navigate
            Navigator.of(context).pop();
            Navigator.pushNamed(context, RouteTo.SHOP_ADMIN);
          },
        ),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text("Wallet"),
          subtitle: Text("Your wallet here"),
          onTap: () {
            // todo : navigate
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: Icon(Icons.local_play),
          title: Text("Wish list"),
          subtitle: Text("Anything new?"),
          onTap: () {
            Navigator.of(context).pop();
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
            Navigator.of(context).pop();

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
            Navigator.pop(context);
            Navigator.pushNamed(context, RouteTo.ORDER_CART);

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
        ListTile(
          leading: Icon(Icons.help),
          title: Text("change Theme"),
          trailing: Switch(
            value: isDark,
            onChanged: (value) {
              isDark = value;
              if (value) {
                BlocProvider.of<ThemeBloc>(context)
                    .add(ThemeChange(appData: AppData.Dark));
              } else {
                BlocProvider.of<ThemeBloc>(context)
                    .add(ThemeChange(appData: AppData.Light));
              }
            },
          ),
          onTap: () {
            //Navigator.pop(context); // Pops the navigation side drawer
            // todo : help page here.
          },
        ),
        BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserSignedInState) {
            return ListTile(
              leading: Icon(Icons.logout),
              title: Text("sign out"),
              onTap: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.INFO_REVERSED,
                  borderSide: BorderSide(color: Colors.transparent, width: 2),
                  width: 380,
                  buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                  headerAnimationLoop: false,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Sign out',
                  desc: 'do you want to sing out?',
                  showCloseIcon: true,
                  btnCancelOnPress: () {},
                  btnOkOnPress: () async {
                    BlocProvider.of<UserBloc>(context).add(UserSignOut());

                    BlocListener<UserBloc, UserState>(
                      listener: (context, state) {
                        // TODO: implement listener}
                        if (state is UserSignedOutState) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.SUCCES,
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 2),
                            width: 380,
                            buttonsBorderRadius:
                                BorderRadius.all(Radius.circular(2)),
                            headerAnimationLoop: false,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Successful',
                            desc: 'you have Successful Sign out',
                            showCloseIcon: true,
                            btnOkOnPress: () {},
                          )..show();
                        }
                      },
                    );
                  },
                )..show();

                //Navigator.pop(context); // Pops the navigation side drawer
                // todo : help page here.
              },
            );
          } else if (state is UserSignedOutState) {
            return ListTile(
              leading: Icon(Icons.login),
              title: Text("sign in"),
              onTap: () {
                Navigator.pushNamed(context, RouteTo.PROFILE_SIGN_IN);

                //Navigator.pop(context); // Pops the navigation side drawer
                // todo : help page here.
              },
            );
          } else if (state is UserInitial) {
            return ListTile();
          }
          return null;
        }),
      ],
    ));
  }

  static getAppBar(BuildContext context, String title,
      {bool showCategory = false}) {
    return AppBar(
      actions: <Widget>[showCategory ? CategoryMenu() : Container()],
      title: Text(title),
      centerTitle: true,
      elevation: 20.0,
    );
  }
}
